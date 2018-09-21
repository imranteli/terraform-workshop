resource "aws_instance" "pluto" {
  ami = "${lookup(var.AL-AMI, var.AWS_REGION)}"
  instance_type = "t2.micro"
}

