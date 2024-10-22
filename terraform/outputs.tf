output "cluster_endpoint" {
  description = "L'endpoint du cluster EKS"
  value       = aws_eks_cluster.mykubernetes.endpoint  # Mise à jour du nom du cluster
}

output "cluster_name" {
  description = "Le nom du cluster EKS"
  value       = aws_eks_cluster.mykubernetes.name  # Mise à jour du nom du cluster
}

output "cluster_role_arn" {
  description = "L'ARN du rôle IAM du cluster EKS"
  value       = aws_eks_cluster.mykubernetes.role_arn
}
