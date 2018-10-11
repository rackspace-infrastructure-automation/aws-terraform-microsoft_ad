provider "aws" {
  version = "~> 1.2"
  region  = "us-east-1"
}

data "aws_kms_secrets" "ad_credentials" {
  secret {
    name    = "password"
    payload = "AQICAHgna1G9z6AbpJYgDg7ULfBhI3sp9slmmTq83jFjJwohCAEEB9ZauMcEh9fdXAyp6Bd0AAAAbjBsBgkqhkiG9w0BBwagXzBdAgEAMFgGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMeCgi8fGMf98ZkLFWAgEQgCvEJVnmyR/ZhmKn+oxEE2mVIzhauitVAtIhS4+LQa6zHmGWLXQQCChPHAVc"
  }
}

module "vpc" {
  source   = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork//?ref=v0.0.4"
  vpc_name = "ad_vpc"
}

module "msad" {
  source     = "git@github.com:rackspace-infrastructure-automation/aws-terraform-microsoft_ad//?ref=v0.0.1"
  name       = "corp.example.local"
  password   = "${data.aws_kms_secrets.ad_credentials.plaintext["password"]}"
  vpc_id     = "${module.vpc.vpc_id}"
  subnet_ids = "${module.vpc.private_subnets}"
  short_name = "corp"
}
