module "aws_vpc" {
  source          = "../modules/vpc"
  networking      = var.networking
  security_groups = var.security_groups
}
