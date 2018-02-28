resource "aws_subnet" "public" {
  cidr_block = "${var.public_subnet_cidr_block}"
  vpc_id     = "${aws_vpc.vpc.id}"

  tags {
    Name     = "${var.tag_name}"
    type     = "public"
  }
}

resource "aws_subnet" "private" {
  cidr_block = "${var.private_subnet_cidr_block}"
  vpc_id     = "${aws_vpc.vpc.id}"

  tags {
    Name     = "${var.tag_name}"
    type     = "private"
  }
}
