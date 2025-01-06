variable "aws_region" {
    description = "The AWS region to deploy the resources"
    type        = string
    default     = "ap-south-1"  # Replace with your preferred region
}

variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type        = string
    default     = "ami-053b12d3152c0cc7"  # Replace with the desired AMI ID
}

variable "instance_type" {
    description = "EC2 instance type"
    type        = string
    default     = "t2.large"
}

variable "key_name" {
    description = "Name of the key pair to access the EC2 instance"
    type        = string
    default     = "eks8_key"
}
