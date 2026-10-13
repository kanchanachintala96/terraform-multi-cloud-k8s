module "aws_eks" {
  count  = var.create_aws_cluster ? 1 : 0
  source = "../aws-eks"

  cluster_name                 = "${var.cluster_name}-aws"
  environment                  = var.environment
  kubernetes_version           = var.aws_kubernetes_version
  node_count                   = var.node_count
  endpoint_public_access_cidrs = var.aws_endpoint_public_access_cidrs
}

module "azure_aks" {
  count  = var.create_azure_cluster ? 1 : 0
  source = "../azure-aks"

  cluster_name       = "${var.cluster_name}-azure"
  environment        = var.environment
  location           = var.azure_location
  kubernetes_version = var.azure_kubernetes_version
  node_count         = var.node_count
  max_node_count     = var.max_node_count
}