terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "aws" {
  region = var.aws_region
}

module "clusters" {
  source = "./modules/cluster"

  cluster_name                    = var.cluster_name
  environment                     = var.environment
  create_aws_cluster              = var.create_aws_cluster
  create_azure_cluster            = var.create_azure_cluster
  aws_kubernetes_version          = var.aws_kubernetes_version
  aws_endpoint_public_access_cidrs = var.aws_endpoint_public_access_cidrs
  azure_kubernetes_version        = var.azure_kubernetes_version
  azure_location                  = var.azure_location
  node_count                      = var.node_count
  max_node_count                  = var.max_node_count
}