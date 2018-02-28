resource "aws_vpc" "vpc" {
  cidr_block    = "${var.vpc_cidr_block}"
  tags {
    Name        = "${var.tag_name}"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id        = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.tag_name}"
  }
}

resource "aws_eip" "nat_gw_eip" {}

resource "aws_nat_gateway" "nat_gw"{
  allocation_id = "${aws_eip.nat_gw_eip.id}"
  subnet_id     = "${aws_subnet.public.id}"
  depends_on    = ["aws_internet_gateway.ig"]
  tags {
    Name        = "${var.tag_name}"
  }
}
