networking = {
  cidr_block      = "10.30.0.0/16"
  region          = "us-east-2"
  vpc_name        = "tap-dev-eks-vpc"
  azs             = ["us-east-2a", "us-east-2b"]
  public_subnets  = ["10.30.1.0/24", "10.30.2.0/24"]
  private_subnets = ["10.30.3.0/24", "10.30.4.0/24"]
  nat_gateways    = true
}

security_groups = [
  {
    name        = "tap-prod-eks-security-group"
    description = "Inbound & Outbound traffic for dev-security-group"
    ingress = [
      {
        description      = "Allow HTTPS"
        protocol         = "tcp"
        from_port        = 443
        to_port          = 443
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
      },
      {
        description      = "Allow HTTP"
        protocol         = "tcp"
        from_port        = 80
        to_port          = 80
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
      }
    ]
    egress = [
      {
        description      = "Allow all outbound traffic"
        protocol         = "-1"
        from_port        = 0
        to_port          = 0
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
      }
    ]
  }
]

cluster_config = {
  name    = "tap-prod-eks-cluster"
  version = "1.31"
}

node_groups = [
  {
    name           = "tap-prod-eks-node-group"
    instance_types = ["t3.medium"]
    ami_type       = "AL2_x86_64"
    capacity_type  = "ON_DEMAND"
    disk_size      = 20
    scaling_config = {
      desired_size = 2
      min_size     = 1
      max_size     = 3
    }
    update_config = {
      max_unavailable = 1
    }
  }
]

addons = [
  {
    name    = "kube-proxy"
    version = "v1.31.3-eksbuild.2"
  },
  {
    name    = "vpc-cni"
    version = "v1.19.2-eksbuild.5"
  },
  {
    name    = "coredns"
    version = "v1.11.4-eksbuild.2"
  },
  {
    name    = "aws-ebs-csi-driver"
    version = "v1.41.0-eksbuild.1"
  }
]
