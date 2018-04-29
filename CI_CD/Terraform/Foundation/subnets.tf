resource "aws_subnet" "public1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_public1_cidr}"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags {
    Name = "${var.name}-public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_public2_cidr}"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1c"

  tags {
    Name = "${var.name}-public2"
  }
}

resource "aws_subnet" "public3" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_public3_cidr}"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags {
    Name = "${var.name}-public3"
  }
}

resource "aws_subnet" "public4" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_public4_cidr}"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1d"

  tags {
    Name = "${var.name}-public4"
  }
}

resource "aws_subnet" "weblayer_private1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_web_private1_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"

  tags {
    Name = "${var.name}-webserver-private1"
  }
}

resource "aws_subnet" "weblayer_private2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_web_private2_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1c"

  tags {
    Name = "${var.name}-webserver-private2"
  }
}

resource "aws_subnet" "weblayer_private3" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_web_private3_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1b"

  tags {
    Name = "${var.name}-webserver-private3"
  }
}

resource "aws_subnet" "weblayer_private4" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_web_private4_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1d"

  tags {
    Name = "${var.name}-webserver-private4"
  }
}

resource "aws_subnet" "applayer_private1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_appserver_private1_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"

  tags {
    Name = "${var.name}-appserver-private1"
  }
}

resource "aws_subnet" "applayer_private2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_appserver_private2_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1c"

  tags {
    Name = "${var.name}-appserver-private2"
  }
}

resource "aws_subnet" "applayer_private3" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_appserver_private3_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1b"

  tags {
    Name = "${var.name}-appserver-private3"
  }
}

resource "aws_subnet" "applayer_private4" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_appserver_private4_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1d"

  tags {
    Name = "${var.name}-appserver-private4"
  }
}

resource "aws_subnet" "dblayer_private1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_dbserver_private1_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"

  tags {
    Name = "${var.name}-dbserver-private1"
  }
}

resource "aws_subnet" "dblayer_private2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_dbserver_private2_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1c"

  tags {
    Name = "${var.name}-dbserver-private2"
  }
}

resource "aws_subnet" "dblayer_private3" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_dbserver_private3_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1b"

  tags {
    Name = "${var.name}-dbserver-private3"
  }
}

resource "aws_subnet" "dblayer_private4" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_dbserver_private4_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1d"

  tags {
    Name = "${var.name}-dbserver-private4"
  }
}

resource "aws_subnet" "webelb_private1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_webelb_private1_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"

  tags {
    Name = "${var.name}-webelb-private1"
  }
}

resource "aws_subnet" "webelb_private2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_webelb_private2_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1c"

  tags {
    Name = "${var.name}-webelb-private2"
  }
}

resource "aws_subnet" "appelb_private1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_appelb_private1_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"

  tags {
    Name = "${var.name}-appelb-private1"
  }
}

resource "aws_subnet" "appelb_private2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_appelb_private2_cidr}"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1c"

  tags {
    Name = "${var.name}-appelb-private2"
  }
}

output "public1_subnet_id" {
 value = "${aws_subnet.public1.id}"
}
output "public2_subnet_id" {
 value = "${aws_subnet.public2.id}"
}
output "public3_subnet_id" {
 value = "${aws_subnet.public3.id}"
}
output "public4_subnet_id" {
 value = "${aws_subnet.public4.id}"
}

output "weblayer_private1_subnet_id" {
  value = "${aws_subnet.weblayer_private1.id}"
}
output "weblayer_private2_subnet_id" {
  value = "${aws_subnet.weblayer_private2.id}"
}
output "weblayer_private3_subnet_id" {
  value = "${aws_subnet.weblayer_private3.id}"
}
output "weblayer_private4_subnet_id" {
  value = "${aws_subnet.weblayer_private4.id}"
}

output "applayer_private1_subnet_id" {
  value = "${aws_subnet.applayer_private1.id}"
}
output "applayer_private2_subnet_id" {
  value = "${aws_subnet.applayer_private2.id}"
}
output "applayer_private3_subnet_id" {
  value = "${aws_subnet.applayer_private3.id}"
}
output "applayer_private4_subnet_id" {
  value = "${aws_subnet.applayer_private4.id}"
}

output "dblayer_private1_subnet_id" {
  value = "${aws_subnet.dblayer_private1.id}"
}
output "dblayer_private2_subnet_id" {
  value = "${aws_subnet.dblayer_private2.id}"
}
output "dblayer_private3_subnet_id" {
  value = "${aws_subnet.dblayer_private3.id}"
}
output "dblayer_private4_subnet_id" {
  value = "${aws_subnet.dblayer_private4.id}"
}

output "webelb_private1_subnet_id" {
  value = "${aws_subnet.webelb_private1.id}"
}
output "webelb_private2_subnet_id" {
  value = "${aws_subnet.webelb_private2.id}"
}
