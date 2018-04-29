/*
# virtual private gateway

resource "aws_vpn_gateway" "vpg" {
    vpc_id = "${aws_vpc.vpc.id}"
	tags {
        Name = "${var.name}-vpg"
    }
}

# Customer Gateways
resource "aws_customer_gateway" "cgw" {
    bgp_asn = 65000
    ip_address = "${var.cgw_peer_ip}"
    type = "ipsec.1"
	tags {
        Name = "${var.name}-cgw"
    }
}

# VPN Connection
resource "aws_vpn_connection" "vpn_connection" {
    vpn_gateway_id = "${aws_vpn_gateway.vpg.id}"
    customer_gateway_id = "${aws_customer_gateway.cgw.id}"
	type = "ipsec.1"
    static_routes_only = true
	tags {
        Name = "${var.name}-vpn"
    }
}

resource "aws_vpn_connection_route" "vpn_route" {
    destination_cidr_block = "${var.cgw_vpn_static_routes}"
    vpn_connection_id = "${aws_vpn_connection.vpn_connection.id}"
}

# Update Private Route table

resource "aws_route" "private-cgw-route" {
  route_table_id = "${aws_route_table.private.id}"
  destination_cidr_block = "${var.cgw_vpn_static_routes}"
  gateway_id = "${aws_vpn_gateway.vpg.id}"
}
*/