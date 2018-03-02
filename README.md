# VPC with Public and Private Subnets and Docker hello_world

This repo contains a Terraform that will build the AWS VPC Scenario 2 as
pictured with an autoscaling group of N instances in the public subnet. Each
instance installs Docker and runs the Docker hello_world container on boot.
![VPC Scenario
2](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/images/nat-gateway-diagram.png)

# Requirements

- Terraform installation (only v0.11.3 is tested) Help [here](https://www.terraform.io/intro/getting-started/install.html)
- AWS CLI installation with credentials file as described
  [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html)

# Usage
```
$ terraform init

$ terraform apply
```

Input variables can be defined as follows:
```
#terraform.tfvars

aws_credentials_file="~/.aws/credentials"
aws_key_path="./sample_key.pub"
aws_key_name="sample_key"
number_instances="2"
```
For all files matching `terraform.tfvars` or `*.auto.tfvars` in the current
directory, Terraform automatically loads them to populate variables. If you wish
to use a variable definition file located elsewhere, pass the path to Terraform
using the `var-file` flag
```
$ terraform apply -var-file=foo.tfvars -var-file=bar.tfvars
```

# All Variables

Other variables may be defined as follows:

```
variable "tag_name" {
  description = "The tag applied to resources launched by this terraform"
  default     = "katie_schilling_code_challenge"
}

variable "aws_region" {
  description = "AWS region in which to launch instances"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of instance launched"
  default     = "t2.micro"
}

variable "vpc_cidr_block" {
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "CIDR for the public subnet"
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr_block" {
  description = "CIDR for the private subnet"
  default     = "10.0.1.0/24"
}
```
