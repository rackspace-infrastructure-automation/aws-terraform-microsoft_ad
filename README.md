# aws-terraform-microsoft\_ad

This module will create a Microsoft Active Directory using AWS Directroy Services.

## Basic Usage

```
module "msad" {
  source     = "git@github.com:rackspace-infrastructure-automation/aws-terraform-microsoft_ad//?ref=v0.12.0"

  name       = "corp.example.local"
  password   = "${data.aws_kms_secrets.ad_credentials.plaintext["password"]}"
  short_name = "corp"
  subnet_ids = "${module.vpc.private_subnets}"
  vpc_id     = "${module.vpc.vpc_id}"
}
```

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| alias | A unique alias to assign to the Microsoft Active Directory in AWS. AWS Directory Service uses the alias to construct the access URL for the directory, such as http://alias.awsapps.com. | `string` | `""` | no |
| description | A textual description for the directory (OPTIONAL) | `string` | `""` | no |
| edition | The MicrosoftAD edition (Standard or Enterprise). Defaults to Enterprise. | `string` | `"Enterprise"` | no |
| enable\_sso | Whether to enable single sign-on for a Microsoft Active Directory in AWS. Single sign-on allows users in your directory to access certain AWS services from a computer joined to the directory without having to enter their credentials separately. If you don't specify a value, AWS CloudFormation disables single sign-on by default. | `bool` | `false` | no |
| environment | Application environment for which this network is being created. one of: ('Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test') | `string` | `"Development"` | no |
| name | The fully qualified name for the Microsoft Active Directory in AWS, such as corp.example.com. The name doesn't need to be publicly resolvable; it will resolve inside your VPC only. | `string` | n/a | yes |
| password | The password for the default administrative user, Admin. | `string` | n/a | yes |
| short\_name | The NetBIOS name for your domain, such as CORP. If you don't specify a value, AWS Directory Service uses the first part of your directory DNS server name. For example, if your directory DNS server name is corp.example.com, AWS Directory Service specifies CORP for the NetBIOS name. | `string` | `""` | no |
| subnet\_ids | A list of at least two subnet IDs for the directory servers. Each subnet must be in different Availability Zones (AZs). AWS Directory Service creates a directory server and a DNS server in each subnet. | `list(string)` | n/a | yes |
| vpc\_id | The VPC ID in which to create the Microsoft Active Directory server. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| access\_url | The access URL for the directory |
| dns\_ip\_addresses | A list of IP addresses of the DNS servers for the directory or connector |
| id | The directory identifier. |
| security\_group\_id | The ID of the security group created by the directory |

