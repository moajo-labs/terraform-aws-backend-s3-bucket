provider "aws" {
  region = "ap-northeast-1"
}

module "backend" {
  source = "moajo-labs/backend-s3-bucket/aws"

  bucket_name = "my-terraform-backend"
}

# Example backend configuration
# terraform {
#   backend "s3" {
#     bucket  = "my-terraform-backend"
#     key     = "terraform.tfstate"
#     region  = "ap-northeast-1"
#     encrypt = true
#   }
# }
