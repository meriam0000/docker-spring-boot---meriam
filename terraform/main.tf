provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "mykubernetes"
  role_arn = "arn:aws:iam::744983671605:role/LabRole"

  vpc_config {
    subnet_ids = ["subnet-075e0dd45da90bdb8", "subnet-0114974e6dbd8217e"]
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = "arn:aws:iam::744983671605:role/LabRole"
  subnet_ids      = ["subnet-075e0dd45da90bdb8", "subnet-0114974e6dbd8217e"]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}
