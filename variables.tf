variable "environment" {
  type        = string
  description = "Target deployment environment."
  default     = "development"

  validation {
    condition     = contains(["development", "staging", "production"], var.environment)
    error_message = "Environment must be development, staging, or production."
  }
}

variable "cluster_name" {
  type        = string
  description = "Base name used for both cloud cluster names."
  default     = "multi-cloud-k8s"
}

variable "create_aws_cluster" {
  type        = bool
  description = "Create AWS networking and an EKS cluster. Enable explicitly to incur AWS charges."
  default     = false
}

variable "create_azure_cluster" {
  type        = bool
  description = "Create Azure networking and an AKS cluster. Enable explicitly to incur Azure charges."
  default     = false
}

variable "aws_region" {
  type        = string
  description = "AWS region for the EKS cluster."
  default     = "us-east-1"
}

variable "azure_location" {
  type        = string
  description = "Azure region for the AKS cluster."
  default     = "East US"
}

variable "aws_kubernetes_version" {
  type        = string
  description = "Kubernetes version for EKS; must be supported in the selected AWS region."
  default     = "1.34"
}

variable "azure_kubernetes_version" {
  type        = string
  description = "Kubernetes version for AKS; must be supported in the selected Azure region."
  default     = null
  nullable    = true
}

variable "node_count" {
  type        = number
  description = "Initial worker node count for each enabled cluster."
  default     = 3

  validation {
    condition     = var.node_count >= 1
    error_message = "node_count must be at least 1."
  }
}

variable "max_node_count" {
  type        = number
  description = "Maximum autoscaled AKS worker node count."
  default     = 5

  validation {
    condition     = var.max_node_count >= var.node_count
    error_message = "max_node_count must be greater than or equal to node_count."
  }
}

variable "aws_endpoint_public_access_cidrs" {
  type        = list(string)
  description = "CIDR ranges allowed to reach the EKS public API endpoint. Set this to your trusted public IP range before enabling AWS."
  default     = ["127.0.0.1/32"]
}