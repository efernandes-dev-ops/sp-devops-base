variable "rds_identifier_name" {
  type        = string
  description = "RDS name"
}

variable "db_name" {
  type        = string
  description = "Database name"
}

variable "db_user" {
  type        = string
  description = "Database username"
}

variable "db_password" {
  type        = string
  description = "Database password"
}

variable "vpc_security_group_id" {
  type        = string
  description = "VPC security group id"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "vpc_subnet_ids" {
  type        = list(string)
  description = "VPC Subnet ids"
}

variable "rds_port_number" {
  type        = string
  description = "RDS Port number"
  default     = 3306
}