resource "aws_key_pair" "loginkey" {
  key_name   = "loginkey"
  public_key = "${file("${var.PUB_KEY}")}"
}

