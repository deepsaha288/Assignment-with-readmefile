variable "region" {
    description = "AWS region"
    type        = string
    default     = "ap-south-1"
}

variable "vpc_name" {
  description = "VPC Name"
  default     = "opensearch-vpc"
}

variable "cidr" {
  description = "VPC CIDR Block"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones"
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "environment" {
  description = "Environment (dev, prod)"
  default     = "dev"
}
