resource "aws_instance" "weber1" {
  ami = "${lookup(var.AMI, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.loginkey.key_name}"
  vpc_security_group_ids = ["${aws_security_group.myterra-sg.id}"]
  
  provisioner "file" {
    source = "websetup.sh"
    destination = "/tmp/websetup.sh"
  }

  provisioner "remote-exec" {
    inline = [
    "chmod +x /tmp/websetup.sh",
    "sudo /tmp/websetup.sh"
    ]
  }
  
  connection {
    user = "${var.USERNAME}"
    private_key = "${file("${var.PRIV_KEY}")}"
  }
}
