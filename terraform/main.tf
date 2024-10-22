provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "mykubernetes"
  role_arn = "arn:aws:iam::744983671605:role/LabRole"
  version  = "1.21"  # Ajoutez la version de Kubernetes

  vpc_config {
    subnet_ids = ["subnet-075e0dd45da90bdb8", "subnet-0114974e6dbd8217e"]
    security_group_ids = ["sg-0123456789abcdef0"]  # Remplacez par le groupe de sécurité
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "noeud1"
  node_role_arn   = "arn:aws:iam::744983671605:role/LabRole"
  subnet_ids      = ["subnet-075e0dd45da90bdb8", "subnet-0114974e6dbd8217e"]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}

output "cluster_endpoint" {
  value = aws_eks_cluster.my_cluster.endpoint
}

output "cluster_name" {
  value = aws_eks_cluster.my_cluster.name
}
