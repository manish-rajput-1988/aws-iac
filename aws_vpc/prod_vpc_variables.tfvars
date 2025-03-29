networking = {
  cidr_block      = "10.0.0.1/16"
  region          = "us-east-2"
  vpc_name        = "taplent-non-prod-vpc"
  azs             = ["us-east-2a", "us-east-2b"]
  public_subnets  = ["10.0.1.1/24", "10.0.2.1/24"]
  private_subnets = ["10.0.3.1/24", "10.0.4.1/24"]
  nat_gateways    = true
}

security_groups = [
  {
    name        = "taplent-non-prod-security-group"
    description = "Inbound & Outbound traffic for custom-security-group"
    ingress = [
      {
        description      = "Allow HTTPS"
        protocol         = "tcp"
        from_port        = 443
        to_port          = 443
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = null
      },
      {
        description      = "Allow HTTP"
        protocol         = "tcp"
        from_port        = 80
        to_port          = 80
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = null
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
