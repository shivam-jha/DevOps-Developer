/*
resource "aws_route53_zone" "prod_hosted_zone" {
  name = "${var.hosted_zone_name}"
  comment = "Production Hosted Zone"
  vpc_id = "${aws_vpc.vpc.id}"
}

output "zone_id" {
  value = "${aws_route53_zone.prod_hosted_zone.zone_id}"
}
*/