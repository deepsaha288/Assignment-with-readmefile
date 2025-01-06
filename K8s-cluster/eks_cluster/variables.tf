variable "region" {
  description = "AWS Region"
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  default     = "opensearch-cluster"
}

variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
  type        = string
}

variable "private_subnets" {
  description = "Private subnets for EKS worker nodes"
  type        = list(string)
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  default     = "dev"
}
