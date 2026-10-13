output "cluster_name" {
  description = "AKS cluster name."
  value       = azurerm_kubernetes_cluster.this.name
}

output "cluster_fqdn" {
  description = "Private API FQDN for the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.private_fqdn
}
