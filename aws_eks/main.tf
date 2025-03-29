module "eks" {
  source = "./modules/eks"
  networking      = var.networking
  security_groups = var.security_groups
  cluster_config  = var.cluster_config
  node_groups     = var.node_groups
  addons          = var.addons
}
