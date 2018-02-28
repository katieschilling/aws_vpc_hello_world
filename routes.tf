resource "aws_route_table" "public" {
  vpc_id           = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id     = "${aws_internet_gateway.ig.id}"
  }

  tags {
    Name           = "${var.tag_name}_public_routes"
  }
}

resource "aws_route_table" "private" {
  vpc_id           = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw.id}"
  }

  tags {
    Name           = "${var.tag_name}_public_routes"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id        = "${aws_subnet.public.id}"
  route_table_id   = "${aws_route_table.public.id}"

}

resource "aws_route_table_association" "private" {
  subnet_id        = "${aws_subnet.private.id}"
  route_table_id   = "${aws_route_table.private.id}"
}

