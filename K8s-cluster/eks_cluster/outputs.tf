output "eks_cluster_name" {
  value = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_node_role_arn" {
  value = module.eks.node_groups["default"].iam_role_arn
}
