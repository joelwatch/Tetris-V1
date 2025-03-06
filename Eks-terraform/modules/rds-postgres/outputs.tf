output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.postgres.endpoint
}

output "db_name" {
  description = "The name of the database"
  value       = aws_db_instance.postgres.db_name
}