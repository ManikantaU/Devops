provider "aws" {
    region = us-east-1
  
}
resource "aws_iam_role" "test" {
    name = "eksrole"
    assume_role_policy = jsonencode()
  
}

resource "aws_eks_cluster" "eks" {
    name = "eks_cluster"
    role_arn = "aws_iam_role.example.arn"
  vpc_config {
    subnet_ids = []
  }

}