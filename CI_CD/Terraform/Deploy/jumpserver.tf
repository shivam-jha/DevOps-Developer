resource "aws_instance" "jumpserver" {
  ami           = "${var.app_rhelserver_ami}"
  instance_type = "t2.micro"
  subnet_id = "${data.terraform_remote_state.foundation.public1_subnet_id}"
  security_groups = ["${data.terraform_remote_state.foundation.jumpserver_sg_id}"]
  key_name = "${var.key_name}"
  tags {
    Name = "${var.name}-jumpserver"
  }
}