resource "aws_key_pair" "al_key"{
  key_name = "loginkey"
  public_key = "${file("${var.PUB_KEY}")}"
}

resource "aws_instance" "weber" {
  ami = "${lookup(var.AL-AMI, var.AWS_REGION)}"
  instance_type = "t2.micro"  
  key_name = "${aws_key_pair.al_key.key_name}"

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


