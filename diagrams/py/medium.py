from diagrams import Cluster, Diagram
from diagrams.aws.compute import ECS, Lambda
from diagrams.aws.database import RDS
from diagrams.aws.integration import SQS
from diagrams.aws.network import ELB, Route53
from diagrams.aws.storage import S3

with Diagram("Event driven service", filename="medium", show=False, direction="LR"):
    dns = Route53("dns")
    lb = ELB("edge")

    with Cluster("Application"):
        api = ECS("api")
        worker = Lambda("worker")

    with Cluster("Data"):
        queue = SQS("jobs")
        archive = S3("archive")
        db = RDS("orders")

    dns >> lb >> api
    api >> queue
    api >> db
    queue >> worker >> archive
