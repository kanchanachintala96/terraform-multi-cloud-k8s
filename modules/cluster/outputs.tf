output "aws_cluster_name" {
  description = "EKS cluster name, or null when AWS is disabled."
  value       = try(module.aws_eks[0].cluster_name, null)
}

output "aws_cluster_endpoint" {
  description = "EKS API endpoint, or null when AWS is disabled."
  value       = try(module.aws_eks[0].cluster_endpoint, null)
}

output "azure_cluster_name" {
  description = "AKS cluster name, or null when Azure is disabled."
  value       = try(module.azure_aks[0].cluster_name, null)
}

output "azure_cluster_fqdn" {
  description = "Private AKS API FQDN, or null when Azure is disabled."
  value       = try(module.azure_aks[0].cluster_fqdn, null)
}