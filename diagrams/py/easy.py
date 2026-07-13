from diagrams import Diagram
from diagrams.aws.compute import EC2
from diagrams.aws.database import RDS
from diagrams.aws.network import ELB

with Diagram("Simple web stack", filename="easy", show=False, direction="LR"):
    ingress = ELB("ingress")
    app = EC2("app")
    db = RDS("db")

    ingress >> app >> db
