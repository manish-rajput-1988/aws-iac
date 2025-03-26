


        description      = "Allow HTTP"
        protocol         = "tcp"
        from_port        = 80
        to_port          = 80
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = null
      },

variable "cluster_config" {
  type = object({
    name    = string
    version = string
  })
  default = {
    name    = "eks-cluster"
    version = "1.31"
  }
}

variable "node_groups" {
  type = list(object({
    name           = string
    instance_types = list(string)
    ami_type       = string
    capacity_type  = string
    disk_size      = number
    scaling_config = object({
      desired_size = number
      min_size     = number
      max_size     = number
    })
    update_config = object({
      max_unavailable = number
    })
  }))
  default = [
    {
      name           = "t3-medim-standard"
      instance_types = ["t3.medium"]
      ami_type       = "AL2_x86_64"
      capacity_type  = "ON_DEMAND"
      disk_size      = 20
      scaling_config = {
        desired_size = 2
        max_size     = 3
        min_size     = 1
      }
      update_config = {
        max_unavailable = 1
      }
    },
  
  ]

}

variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))
  default = [
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
      version = "v1.35.0-eksbuild.0"
    }
  ]
}
