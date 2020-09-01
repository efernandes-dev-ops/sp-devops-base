output "vpc_id" {
  description = "VPC id"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "VPC public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "VPC private subnets"
  value       = module.vpc.private_subnets
}

output "cidr_block" {
  description = "VPC cidr block"
  value       = module.vpc.vpc_cidr_block
}

output "security_group_id" {
  description = "VPC Security Group id"
  value       = module.vpc.default_vpc_default_security_group_id
}
