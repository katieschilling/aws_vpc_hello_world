data "aws_ami" "linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.linux.id}"
  instance_type = "t2.micro"
  count         = "${var.number_instances}"
  key_name      = "${var.aws_key_name}"
  tags {
    Name        = "${var.tag_name}-${count.index}"
  }

  user_data     = "#!/bin/bash; set -xe; yum install -y docker; service docker start; chkconfig docker on; docker run hello-world"
}

