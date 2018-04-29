/*
resource "aws_vpc_peering_connection" "mgmt_to_prod" {
    vpc_id = "${aws_vpc.vpc.id}"
    peer_vpc_id = "${var.mgmt_vpc_id}"
    auto_accept = true
    tags {
      Name = "${var.name}-mgmt-pc"
    }
}

resource "aws_route" "prod-peering-public-route" {
  route_table_id = "${aws_route_table.public.id}"
  destination_cidr_block = "${var.mgmt_vpc_cidr}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt_to_prod.id}"
}

resource "aws_route" "prod-peering-private-route" {
  route_table_id = "${aws_route_table.private.id}"
  destination_cidr_block = "${var.mgmt_vpc_cidr}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.mgmt_to_prod.id}"
}
*/