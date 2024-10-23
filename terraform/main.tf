provider "aws" {
  region = var.aws_region
}

resource "aws_eks_cluster" "my_cluster" {
  name     = var.cluster_name
  role_arn = var.role_arn
  version  = "1.30"

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = [aws_security_group.eks_cluster_sg.id]  # Utilisation du groupe de sécurité ci-dessous
  }
}

resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks-cluster-sg-${var.cluster_name}"
  description = "Security group for EKS cluster ${var.cluster_name}"
  vpc_id      = var.vpc_id

  # Règles pour autoriser le trafic entrant pour l'application
  ingress {
    from_port   = 8083
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Autorise tout le monde à accéder à l'application via le port 8083
  }

  ingress {
    from_port   = 30000
    to_port     = 30000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Autorise l'accès sur le port 30000
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Autorise tout le trafic sortant
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-cluster-sg-${var.cluster_name}"
  }
}

resource "aws_security_group" "eks_worker_sg" {
  name        = "eks-worker-sg-${var.cluster_name}"
  description = "Security group for EKS worker nodes ${var.cluster_name}"
  vpc_id      = var.vpc_id

  # Règles pour autoriser le trafic entrant pour les nœuds de travail
  ingress {
    from_port   = 8083
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Ajustez selon vos besoins de sécurité
  }

  ingress {
    from_port   = 30000
    to_port     = 30000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Ajustez selon vos besoins de sécurité
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Autorise tout le trafic sortant
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-worker-sg-${var.cluster_name}"
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
