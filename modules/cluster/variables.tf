terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

variable "cluster_name" {
  type        = string
  description = "Base name used for both cloud cluster names."
}

variable "environment" {
  type        = string
  description = "Environment tag."
}

variable "create_aws_cluster" {
  type        = bool
  description = "Whether to create AWS networking and an EKS cluster."
}

variable "create_azure_cluster" {
  type        = bool
  description = "Whether to create Azure networking and an AKS cluster."
}

variable "aws_kubernetes_version" {
  type        = string
  description = "Kubernetes version for EKS."
}

variable "aws_endpoint_public_access_cidrs" {
  type        = list(string)
  description = "CIDRs allowed to reach the EKS public API endpoint."
}

variable "azure_kubernetes_version" {
  type        = string
  description = "Optional Kubernetes version for AKS."
  default     = null
  nullable    = true
}

variable "azure_location" {
  type        = string
  description = "Azure region for the AKS cluster."
}

variable "node_count" {
  type        = number
  description = "Initial worker node count."
}

variable "max_node_count" {
  type        = number
  description = "Maximum AKS worker node count."
}
