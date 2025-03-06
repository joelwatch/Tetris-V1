variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "prefix" {
  description = "Prefix for the resource names"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets CIDR blocks"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnets CIDR blocks"
  type        = list(string)
}

variable "database_subnets" {
  description = "List of database subnets CIDR blocks"
  type        = list(string)
}