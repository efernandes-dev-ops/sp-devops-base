variable "asg_name" {
  description = "ASG name"
  type        = string
}

variable "launch_config_name" {
  description = "Launch Configuration name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "public_subnets" {
  description = "VPC public subnets"
  type        = list(string)
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the launch configuration"
  type        = list(string)
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to associate with launched instances"
  type        = string
}

variable "sp_docker_image" {
  description = "Web application docker image to use"
  type        = string
}

variable "database_host" {
  description = "Database host"
  type        = string
}

variable "database_username" {
  description = "Database username"
  type        = string
}

variable "database_password" {
  description = "Database password"
  type        = string
}

variable "database_port" {
  description = "Database port"
  type        = string
  default     = "3306"
}

variable "target_group_arns" {
  description = "Target Group arns"
  type        = list(string)
}
