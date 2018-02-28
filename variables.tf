variable "aws_credentials_file" {}
variable "aws_key_path" {}
variable "aws_key_name" {}
variable "aws_region" {
  description = "AWS region in which to launch instances"
  default     = "us-east-1"
}
