variable "aws_credentials_file" {}
variable "aws_key_path" {}
variable "aws_key_name" {}
variable "number_instances" {}

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
