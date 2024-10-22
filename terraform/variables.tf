variable "aws_region" {
  description = "La région AWS"
  default     = "us-east-1"  # Région mise à jour
}

variable "cluster_name" {
  description = "Nom du cluster EKS"
  default     = "mykubernetes"  # Nom du cluster mis à jour
}

variable "subnet_ids" {
  description = "IDs des sous-réseaux"
  type        = list(string)
  default     = ["subnet-075e0dd45da90bdb8", "subnet-0114974e6dbd8217e"]  # Ajoutez des valeurs par défaut si nécessaire
}

variable "role_arn" {
  description = "ARN du rôle IAM pour EKS"
  type        = string
  default     = "arn:aws:iam::744983671605:role/LabRole"  # Ajoutez une valeur par défaut si nécessaire
}
