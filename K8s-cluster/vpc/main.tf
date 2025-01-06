module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name    = var.vpc_name
  cidr    = var.cidr
  azs     = var.availability_zones
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Name = var.vpc_name
    Environment = var.environment
  }
}
