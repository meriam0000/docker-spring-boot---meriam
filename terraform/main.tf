provider "aws" {
  region = var.aws_region
}

resource "aws_eks_cluster" "my_cluster" {
  name     = var.cluster_name
  role_arn = var.role_arn
  version  = "1.30"  # Version de Kubernetes

  vpc_config {
    subnet_ids          = var.subnet_ids
    security_group_ids = ["sg-01156caafc1ff73fb"]  # Utilisation du groupe de sécurité par défaut
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "noeud1"
  node_role_arn   = var.role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}
