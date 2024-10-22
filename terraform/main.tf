provider "aws" {
  region = "us-east-1"  # Changer la région à us-east-1
}

resource "aws_eks_cluster" "my_cluster" {
  name     = "mykubernetes"  # Nom du cluster
  role_arn = "arn:aws:iam::744983671605:role/LabRole"  # Utilise l'ARN de rôle fourni

  vpc_config {
    subnet_ids = ["subnet-075e0dd45da90bdb8", "subnet-0114974e6dbd8217e"]  # Remplace par tes IDs de sous-réseaux
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = "arn:aws:iam::744983671605:role/LabRole"  # Utilise l'ARN de rôle fourni
  subnet_ids      = ["subnet-12345678", "subnet-87654321"]  # Remplace par tes IDs de sous-réseaux

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}
