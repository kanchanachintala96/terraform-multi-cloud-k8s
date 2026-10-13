terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

variable "cluster_name" {
  type        = string
  description = "AKS cluster name."
}

variable "environment" {
  type        = string
  description = "Environment tag."
}

variable "location" {
  type        = string
  description = "Azure region for the cluster."
}

variable "kubernetes_version" {
  type        = string
  description = "Optional Kubernetes version supported by AKS in the selected region."
  default     = null
  nullable    = true
}

variable "node_count" {
  type        = number
  description = "Initial AKS worker node count."
}

variable "max_node_count" {
  type        = number
  description = "Maximum AKS worker node count."
}

variable "vnet_cidr" {
  type        = string
  description = "CIDR block for the AKS virtual network."
  default     = "10.30.0.0/16"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR block for the AKS node subnet."
  default     = "10.30.1.0/24"
}
