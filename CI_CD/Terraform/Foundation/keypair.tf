resource "aws_key_pair" "ssh_key" {
  key_name   = "${var.key_name}"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJbd2nGd028GXcH1Xes2xTsAyy7o0oMndPFbPLMwSXJMQMNiURDoQGsbxH8H21H7FR2MmQ6HhVQQnv6FxKJNs8zV7cwcNrPUZ6J58y/gDElAUz/POujrJ2JV9fM/Elpe5ApicJGwYMArFC/aKPYzAcRcyT/eM/IhFWCgA/kAZd5klxWOlS9N1IRbGKoCL/d57fLs57477gO7ZoIcXpsG4iz5G41Hf5Uo5GIPsh+24kXq4C95D6RUz8wVRLDOcWzS39b9jVLHDcZoge5J6kPW8sA8MnoWjyj/H5d1Sn3b4lrlW8YPX9EstoKp0U2EETjsy+oeqZhslpWcG2A3fniMzb"
}