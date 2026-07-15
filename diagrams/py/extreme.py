from diagrams import Cluster, Diagram
from diagrams.aws.compute import ECS, Lambda
from diagrams.aws.database import RDS
from diagrams.aws.integration import SQS
from diagrams.aws.network import CloudFront, ELB, Route53
from diagrams.aws.storage import S3
from diagrams.k8s.compute import Pod
from diagrams.onprem.queue import Kafka

with Diagram("Extreme digital platform", filename="extreme", show=False, direction="LR"):
    dns = Route53("global dns")
    cdn = CloudFront("cdn")
    edge_lb = ELB("edge api gateway")
    edge_firewall = Lambda("api policy")

    with Cluster("Platform"):
        with Cluster("Identity"):
            authz = ECS("auth service")
            identity = ECS("identity service")
            tokens = Lambda("token service")

        with Cluster("Commerce APIs"):
            public_api = ECS("public api")
            partner_api = ECS("partner api")
            catalog_api = ECS("catalog api")
            order_api = ECS("order api")
            pricing_api = ECS("pricing api")

        with Cluster("Execution"):
            command = ECS("orchestrator")
            policy_engine = Lambda("policy engine")
            fulfillment = ECS("fulfillment")
            fraud = Lambda("fraud")
            billing = ECS("billing")

    with Cluster("Data Plane"):
        with Cluster("Transactional"):
            orders_db = RDS("orders db")
            payments_db = RDS("payments db")
            inventory_db = RDS("inventory db")
            profile_db = RDS("profiles db")

        with Cluster("Streaming"):
            events = SQS("events queue")
            bus = Kafka("event bus")
            s3_archive = S3("immutable archive")

    with Cluster("Analytics"):
        etl = Pod("stream-etl")
        features = Pod("feature store")
        model = Pod("fraud model")

    # ingress path
    dns >> cdn >> edge_lb
    edge_lb >> edge_firewall
    edge_firewall >> authz
    edge_firewall >> identity

    # commerce API calls
    authz >> public_api
    identity >> tokens
    tokens >> public_api
    tokens >> partner_api

    public_api >> catalog_api
    public_api >> order_api
    partner_api >> order_api
    order_api >> pricing_api
    pricing_api >> policy_engine

    order_api >> fraud
    order_api >> fulfillment
    fulfillment >> inventory_db
    order_api >> payments_db
    fraud >> model
    policy_engine >> command

    # persistence
    catalog_api >> orders_db
    catalog_api >> inventory_db
    order_api >> orders_db
    pricing_api >> payments_db
    billing >> payments_db
    public_api >> profile_db
    identity >> profile_db

    # async event mesh
    command >> events
    fulfillment >> events
    fraud >> events
    billing >> events
    events >> bus
    bus >> etl
    bus >> s3_archive
    bus >> features
    events >> order_api

    etl >> model
    etl >> features
    features >> fraud
    features >> pricing_api

    # feedback loops
    public_api >> events
    billing >> s3_archive
    profile_db >> model
    order_api >> bus
