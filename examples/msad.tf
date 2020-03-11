terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.1"
}

resource "random_string" "rstring" {
  length  = 18
  special = true
  upper   = false
}

module "vpc" {
  source   = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork//?ref=v0.12.0"

  name     = "ad_vpc"
}

module "msad" {
  source     = "git@github.com:rackspace-infrastructure-automation/aws-terraform-microsoft_ad//?ref=v0.12.0"

  name       = "corp.example.local"
  password   = random_string.rstring.result
  short_name = "corp"
  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id
}


