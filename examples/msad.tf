provider "aws" {
  region  = "us-east-1"
  version = "~> 2.1"
}

resource "random_string" "rstring" {
  length  = 18
  upper   = false
  special = true
}

module "vpc" {
  source   = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork//?ref=v0.12.0"
  name     = "ad_vpc"
}

module "msad" {
  source     = "git@github.com:rackspace-infrastructure-automation/aws-terraform-microsoft_ad//?ref=v0.12.0"
  name       = "corp.example.local"
  password   = random_string.rstring.result
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  short_name = "corp"
}


