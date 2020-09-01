module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.48.0"

  name = "${var.vpc_name}-${var.environment}"

  cidr = var.vpc_cidr

  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_ipv6 = true

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Owner       = "terraform"
    Environment = var.environment
  }
}
