variable "aws_region" {
  description = "La région AWS"
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "Nom du cluster EKS"
  default     = "my-cluster"
}

variable "subnet_ids" {
  description = "IDs des sous-réseaux"
  type        = list(string)
}
