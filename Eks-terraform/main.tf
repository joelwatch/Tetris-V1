provider "aws" {
  region = var.aws_region
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.eks_cluster_name
  node_group_name = var.eks_node_group_name
  instance_types  = var.eks_instance_types
  desired_size    = var.eks_desired_size
  max_size        = var.eks_max_size
  min_size        = var.eks_min_size
}

module "rds_postgres" {
  source = "./modules/rds-postgres"

  db_instance_identifier = var.rds_instance_identifier
  db_name                = var.rds_db_name
  db_username            = var.rds_username
  db_password            = var.rds_password
  db_instance_class      = var.rds_instance_class
  allocated_storage      = var.rds_allocated_storage
  engine_version         = var.rds_engine_version
  skip_final_snapshot    = var.rds_skip_final_snapshot
}