output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnets
}

output "eks_cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "eks_cluster_id" {
  description = "EKS Cluster ID"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_version" {
  description = "Kubernetes version"
  value       = module.eks.cluster_version
}

output "eks_node_group_role_arn" {
  description = "ARN of the node group IAM role"
  value       = module.eks.eks_managed_node_groups["default"].iam_role_arn
}

output "kubeconfig" {
  description = "Kubeconfig content for use with kubectl"
  value       = module.eks.kubeconfig
  sensitive   = true
}
