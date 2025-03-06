output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.cluster.name
}

output "node_group_name" {
  description = "The name of the EKS node group"
  value       = aws_eks_node_group.node_group.node_group_name
}