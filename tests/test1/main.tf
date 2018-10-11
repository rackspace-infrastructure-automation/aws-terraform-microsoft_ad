provider "aws" {
  version = "~> 1.2"
  region  = "us-west-2"
}

resource "random_string" "password" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_string" "alias_name" {
  length  = 15
  special = false
  number  = false
  lower   = true
  upper   = false
}

module "vpc" {
  source   = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork//?ref=v0.0.4"
  vpc_name = "ad_vpc"
}

module "msad" {
  source     = "../../module"
  name       = "corp.example.local"
  password   = "${random_string.password.result}"
  vpc_id     = "${module.vpc.vpc_id}"
  subnet_ids = "${module.vpc.private_subnets}"
  alias      = "${random_string.alias_name.result}-examplead"
  short_name = "corp"
  enable_sso = "true"
}
