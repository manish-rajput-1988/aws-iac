module "eks" {
  source             = "../modules/eks"
  cluster_config     = var.cluster_config
  node_groups        = var.node_groups
  addons             = var.addons
  security_groups_id = module.vpc.security_groups_id
  public_subnets_id  = module.vpc.public_subnets_id
  private_subnets_id = module.vpc.private_subnets_id
  oidc               = "oidc.eks.us-east-2.amazonaws.com/id/EXAMPLE"
}
