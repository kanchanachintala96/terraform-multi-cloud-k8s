output "aws_cluster_name" {
  description = "Name of the EKS cluster, when enabled."
  value       = module.clusters.aws_cluster_name
}

output "aws_cluster_endpoint" {
  description = "API endpoint of the EKS cluster, when enabled."
  value       = module.clusters.aws_cluster_endpoint
}

output "azure_cluster_name" {
  description = "Name of the AKS cluster, when enabled."
  value       = module.clusters.azure_cluster_name
}

output "azure_cluster_fqdn" {
  description = "Private API FQDN of the AKS cluster, when enabled."
  value       = module.clusters.azure_cluster_fqdn
}
