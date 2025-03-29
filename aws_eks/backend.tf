terraform{
    backend "s3" {
        bucket = "bsuite-terraform-state-bucket-non-prod"
        key = "tap-prod-eks/terraform.tfstate"
        region = "ap-southeast-1"
        dynamodb_table = "bsuite-terraform-non-prod-locks"
        encrypt        = true
    }
}
