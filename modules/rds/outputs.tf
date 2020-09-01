output "rds_host" {
  description = "RDS Host url"
  value       = module.rds.this_db_instance_endpoint
}

output "rds_username" {
  description = "RDS username"
  value       = module.rds.this_db_instance_username
}

output "rds_password" {
  description = "RDS password"
  value       = module.rds.this_db_instance_password
}
