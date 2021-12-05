terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.region
}

module "s3" {
  source      = "./modules/s3"
}


module "iam" {
  source = "./modules/iam"
  image-bucket-arn = module.s3.image-bucket-arn
}