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
}

variable "role_arn" {
  description = "ARN du rôle IAM pour EKS"
  type        = string
}
