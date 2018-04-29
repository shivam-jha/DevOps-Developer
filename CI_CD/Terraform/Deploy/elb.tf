resource "aws_elb" "appelb" {
  name = "${var.name}-app-elb"
  subnets = ["${data.terraform_remote_state.foundation.public1_subnet_id}", "${data.terraform_remote_state.foundation.public2_subnet_id}"]
  security_groups = ["${data.terraform_remote_state.foundation.appelb_sg_id}"]
  listener {
    instance_port = 8080
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
 
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 10
    timeout = 5
    target = "HTTP:8080/"
    interval = 30
  }
  
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400
}

output "app_url" {
	value = "${aws_elb.appelb.dns_name}"
}
