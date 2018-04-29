resource "aws_security_group" "jumpserver" {
  name        = "${var.name}-jumpserver_sg"
  description = "Security group for application server"
  vpc_id      = "${aws_vpc.vpc.id}"
  tags {
     Name = "${var.name}-jumpserver-sg"
  }
}
 
resource "aws_security_group_rule" "jumpserver_ingress_ssh" {
	type="ingress"
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = "${aws_security_group.jumpserver.id}"
  }

resource "aws_security_group_rule" "jumpserver_allow_egress_all" {
    type="egress" 
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
	security_group_id = "${aws_security_group.jumpserver.id}"
}

resource "aws_security_group" "appserver" {
  name        = "${var.name}-appserver_sg"
  description = "Security group for application server"
  vpc_id      = "${aws_vpc.vpc.id}"
  tags {
     Name = "${var.name}-appserver-sg"
  }
}

resource "aws_security_group_rule" "appserver_ingress_ssh" {
      type="ingress"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      security_group_id = "${aws_security_group.appserver.id}"
	  source_security_group_id = "${aws_security_group.jumpserver.id}"
}
  
resource "aws_security_group_rule" "appserver_allow_ingress_8080" {
      type="ingress"
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      security_group_id = "${aws_security_group.appserver.id}"
      source_security_group_id = "${aws_security_group.appelb.id}"
}

resource "aws_security_group_rule" "appserver_allow_egress_http" {
    type="egress" 
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
	security_group_id = "${aws_security_group.appserver.id}"
}
 
resource "aws_security_group_rule" "appserver_allow_egress_https" {
    type="egress" 
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
	security_group_id = "${aws_security_group.appserver.id}"
}

resource "aws_security_group" "appelb" {
  name        = "${var.name}-appelb_sg"
  description = "Security group for application load balancer"
  vpc_id      = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.name}-appelb-sg"
  }
}

resource "aws_security_group_rule" "appelb_ingress_80" {
      type="ingress"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      security_group_id = "${aws_security_group.appelb.id}"
}
  
resource "aws_security_group_rule" "appelb_allow_egress_http" {
    type="egress" 
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
	security_group_id = "${aws_security_group.appelb.id}"
	source_security_group_id = "${aws_security_group.appserver.id}"
}

output "jumpserver_sg_id" {
  value = "${aws_security_group.jumpserver.id}"
}
output "appserver_sg_id" {
  value = "${aws_security_group.appserver.id}"
}
output "appelb_sg_id" {
  value = "${aws_security_group.appelb.id}"
}