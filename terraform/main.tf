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

module "my_vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "172.31.0.0/16"
  public_sub_1_cidr   = "172.31.1.0/24"
  public_sub_2_cidr   = "172.31.2.0/24"
  public_sub_3_cidr   = "172.31.3.0/24"
  private_sub_1_cidr  = "172.31.4.0/24"
  private_sub_2_cidr  = "172.31.5.0/24"
  private_sub_3_cidr  = "172.31.6.0/24"
  availability_zone_1 = "${var.region}a"
  availability_zone_2 = "${var.region}b"
  availability_zone_3 = "${var.region}c"
}
