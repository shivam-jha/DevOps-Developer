# Create a VPC to launch 
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = "${var.enable_dns_support}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"

  tags {
    Name = "${var.name}-vpc"
  }
}

# Create an internet gateway to give subnet access to the outside world
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.name}-igw"
  }
}

# Elastic IP for NAT gateway
resource "aws_eip" "nat" {
  vpc      = true
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {
    allocation_id = "${aws_eip.nat.id}"
    subnet_id = "${aws_subnet.public1.id}"
    depends_on = ["aws_internet_gateway.igw"]
}

resource "aws_route_table" "public" {
    vpc_id = "${aws_vpc.vpc.id}"
   tags {
     Name = "${var.name}-public-rt"
   }
}

resource "aws_route_table" "private" {
    vpc_id = "${aws_vpc.vpc.id}"
	tags {
		Name = "${var.name}-private-rt"
	}
}

resource "aws_main_route_table_association" "default" {
    vpc_id = "${aws_vpc.vpc.id}"
    route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route" "public-igw-route" {
  route_table_id = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.igw.id}"
}

resource "aws_route" "private-natgw-route" {
  route_table_id = "${aws_route_table.private.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.nat.id}"
}

resource "aws_route_table_association" "public1" {
  subnet_id = "${aws_subnet.public1.id}"
  route_table_id = "${aws_route_table.public.id}"
}
resource "aws_route_table_association" "public2" {
  subnet_id = "${aws_subnet.public2.id}"
  route_table_id = "${aws_route_table.public.id}"
}
resource "aws_route_table_association" "public3" {
  subnet_id = "${aws_subnet.public3.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public4" {
  subnet_id = "${aws_subnet.public4.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_vpc_endpoint" "s3endpoint" {
  vpc_id       = "${aws_vpc.vpc.id}"
  service_name = "com.amazonaws.us-east-1.s3"
  route_table_ids = ["${aws_route_table.private.id}" , "${aws_route_table.public.id}"]
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
