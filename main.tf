provider "aws" {
  region                  = "${var.aws_region}"
  shared_credentials_file = "${var.aws_credentials_file}"
}

resource "aws_key_pair" "auth" {
  key_name                = "${var.aws_key_name}"
  public_key              = "${file(var.aws_key_path)}"
}

data "aws_ami" "linux" {
  most_recent             = true

  filter {
    name                  = "name"
    values                = ["amzn-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name                  = "virtualization-type"
    values                = ["hvm"]
  }

  filter {
    name                  = "owner-alias"
    values                = ["amazon"]
  }
}

