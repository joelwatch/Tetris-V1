variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "resource_prefix" {
  description = "Prefix for all resources to ensure uniqueness"
  type        = string
}

# EKS Variables
variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "eks_instance_types" {
  description = "Instance types for the EKS node group"
  type        = list(string)
}

variable "eks_desired_size" {
  description = "Desired number of nodes in the EKS node group"
  type        = number
}

variable "eks_max_size" {
  description = "Maximum number of nodes in the EKS node group"
  type        = number
}

variable "eks_min_size" {
  description = "Minimum number of nodes in the EKS node group"
  type        = number
}

# RDS Variables
variable "rds_instance_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}

variable "rds_db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "rds_username" {
  description = "The master username for the database"
  type        = string
}

variable "rds_password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true
}

variable "rds_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "rds_allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "rds_engine_version" {
  description = "The version of PostgreSQL to use"
  type        = string
}

variable "rds_skip_final_snapshot" {
  description = "Whether to skip the final snapshot when destroying the DB"
  type        = bool
}