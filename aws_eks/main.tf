module "eks" {
  source             = "../modules/eks"
  cluster_config     = var.cluster_config
  networking         = {
    public_subnets_id  = module.vpc.public_subnets_id
    private_subnets_id = module.vpc.private_subnets_id
  }
  security_groups_id = module.vpc.security_groups_id
  node_groups        = var.node_groups
  node_group_role_arn = aws_iam_role.NodeGroupRole.arn
  addons             = var.addons
  oidc               = "oidc.eks.us-east-2.amazonaws.com/id/EXAMPLE"
}
