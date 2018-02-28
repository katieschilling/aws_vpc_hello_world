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
