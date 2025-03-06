output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "eks_node_group_name" {
  description = "The name of the EKS node group"
  value       = module.eks.node_group_name
}

output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.rds_postgres.rds_endpoint
}

output "rds_db_name" {
  description = "The name of the database"
  value       = module.rds_postgres.db_name
}