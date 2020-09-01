variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "private_subnets" {
  description = "VPC private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "VPC public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "VPC availability zones"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "VPC cidr range"
  type        = string
}
