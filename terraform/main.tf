provider "aws" {
  region = "us-west-2"  # Change cette région selon tes besoins
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::YOUR_ACCOUNT_ID:role/YOUR_EKS_ROLE" # Remplace par ton ARN de rôle

  vpc_config {
    subnet_ids = ["subnet-12345678", "subnet-87654321"]  # Remplace par tes IDs de sous-réseaux
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = "arn:aws:iam::YOUR_ACCOUNT_ID:role/YOUR_EKS_NODE_ROLE"  # Remplace par ton ARN de rôle
  subnet_ids      = ["subnet-12345678", "subnet-87654321"]  # Remplace par tes IDs de sous-réseaux

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}
