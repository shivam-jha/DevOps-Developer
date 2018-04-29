resource "aws_launch_configuration" "appserver" {
  name = "${var.name}-appserver-launch-config"
  image_id = "${var.app_rhelserver_ami}"
  instance_type = "${var.appserver_instance_type}"
  security_groups = ["${data.terraform_remote_state.foundation.appserver_sg_id}"]
  key_name = "${var.key_name}"
}

resource "aws_autoscaling_group" "appserver_asg" {
  name = "${var.name}-appserver-asg"
  max_size = 1
  min_size = 1
  desired_capacity = 1
  health_check_grace_period = 300
  health_check_type = "EC2"
  force_delete = true
  launch_configuration = "${aws_launch_configuration.appserver.name}"
  load_balancers =["${aws_elb.appelb.name}"]
  vpc_zone_identifier = ["${data.terraform_remote_state.foundation.applayer_private1_subnet_id}", "${data.terraform_remote_state.foundation.applayer_private2_subnet_id}"]
  tag {
    key = "Name"
    value = "${var.name}-appserver"
    propagate_at_launch = true
  }
}
