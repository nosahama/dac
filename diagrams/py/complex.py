from diagrams import Cluster, Diagram
from diagrams.aws.compute import ECS, Lambda
from diagrams.aws.database import RDS
from diagrams.aws.integration import SQS
from diagrams.aws.network import CloudFront, ELB, Route53
from diagrams.aws.storage import S3
from diagrams.k8s.compute import Pod
from diagrams.onprem.queue import Kafka

with Diagram("Multi-region platform", filename="complex", show=False, direction="LR"):
    dns = Route53("dns")
    cdn = CloudFront("cdn")
    ingress = ELB("ingress")

    with Cluster("Region A"):
        with Cluster("Public"):
            web = ECS("web")
        with Cluster("Core"):
            api = ECS("api")
            worker = Lambda("worker")
        with Cluster("Data"):
            db = RDS("primary")
            queue = SQS("events")

    with Cluster("Analytics"):
        bus = Kafka("stream")
        pod = Pod("etl")
        archive = S3("archive")

    dns >> cdn >> ingress >> web
    web >> api >> db
    api >> queue
    queue >> worker >> archive
    queue >> bus >> pod >> archive
