terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name."
}

variable "environment" {
  type        = string
  description = "Environment tag."
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version supported by EKS in the selected region."
}

variable "node_count" {
  type        = number
  description = "Desired managed node group size."
}

variable "endpoint_public_access_cidrs" {
  type        = list(string)
  description = "CIDRs allowed to access the public EKS API endpoint."
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the EKS VPC."
  default     = "10.20.0.0/16"
}
