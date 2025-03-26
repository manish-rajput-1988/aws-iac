terraform{
    backend "s3" {
        bucket = "bsuite-terraform-state-bucket-non-prod"
        key = "taplent-non-prod/terraform.tfstate"
        region = "us-east-2"
        dynamodb_table = "bsuite-terraform-non-prod-locks"
        encrypt        = true
    }
}
