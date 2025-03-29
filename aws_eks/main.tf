module "eks" {
  source           = "../modules/eks"
  cluster_name     = var.cluster_config.name
  cluster_version  = var.cluster_config.version
  cluster_role_arn = aws_iam_role.eks_cluster.arn
  subnet_ids       = flatten([var.networking.public_subnets, var.networking.private_subnets])
  node_group_name  = var.node_groups[0].name
  node_role_arn    = aws_iam_role.node_group.arn
  instance_types   = var.node_groups[0].instance_types
  disk_size        = var.node_groups[0].disk_size
  desired_size     = var.node_groups[0].scaling_config.desired_size
  min_size         = var.node_groups[0].scaling_config.min_size
  max_size         = var.node_groups[0].scaling_config.max_size
  max_unavailable  = var.node_groups[0].update_config.max_unavailable
}
