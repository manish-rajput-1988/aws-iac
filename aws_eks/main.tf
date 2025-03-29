module "eks" {
  source          = "../modules/eks"
  
  cluster_config  = var.cluster_config
  node_groups     = var.node_groups
  networking = {
    vpc_id          = module.vpc.vpc_id
    public_subnets  = module.vpc.public_subnets_id
    private_subnets = module.vpc.private_subnets_id
  }
  security_groups = module.vpc.security_groups_id
  addons          = var.addons
}
