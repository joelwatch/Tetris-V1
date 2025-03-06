variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "instance_types" {
  description = "Instance types for the EKS node group"
  type        = list(string)
}

variable "desired_size" {
  description = "Desired number of nodes in the EKS node group"
  type        = number
}

variable "max_size" {
  description = "Maximum number of nodes in the EKS node group"
  type        = number
}

variable "min_size" {
  description = "Minimum number of nodes in the EKS node group"
  type        = number
}