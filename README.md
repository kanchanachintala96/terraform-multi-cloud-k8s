# Multi-Cloud Kubernetes Infrastructure

Terraform configuration for creating managed Kubernetes clusters on AWS (EKS) and Azure (AKS), with separate modules and networking for each cloud.

## What it creates

- **AWS:** A VPC spanning two availability zones, public and private subnets, a NAT gateway, an EKS control plane, and a managed worker node group in private subnets.
- **Azure:** A resource group, virtual network and node subnet, a user-assigned identity with subnet-scoped Network Contributor access, and a private AKS cluster with autoscaling and Azure RBAC.
- Cluster creation is disabled by default. Enable only the cloud(s) you intend to use; creating both provisions billable resources in both accounts.

The AKS API is private and requires network connectivity to its virtual network. The EKS API is public and private, but its public endpoint defaults to allowing only `127.0.0.1/32`; set `aws_endpoint_public_access_cidrs` to your trusted public IP CIDR before enabling EKS.

## Requirements

- Terraform 1.5 or newer
- AWS credentials with permissions to manage VPC, EKS, EC2, and IAM resources
- Azure credentials with permissions to create resource groups, virtual networks, identities, role assignments, and AKS resources
- A supported Kubernetes version and VM size in each selected region

The AWS provider uses `aws_region`; Azure uses `azure_location`. Authenticate using the standard AWS credential chain and AzureRM-supported environment variables, Azure CLI, or workload identity. Do not place credentials in Terraform files.

## Use

1. Set `create_aws_cluster` and/or `create_azure_cluster` to `true` in a local `terraform.tfvars`.
2. For EKS, set `aws_endpoint_public_access_cidrs` to your trusted public IP range (for example, `["198.51.100.25/32"]`; replace with your actual range).
3. Run:

   ```sh
   terraform init
   terraform fmt -recursive
   terraform validate
   terraform plan
   ```

Review the plan before running `terraform apply`. Terraform's default state is local; configure a secure remote backend with locking before team or production use. No backend is configured in this repository.