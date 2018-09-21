resource "aws_security_group" "myterra-sg" {
  name        = "myterra-sg"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.vpro-vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol = "tcp"
    cidr_blocks = ["124.123.85.227/32"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
    
}

resource "aws_security_group" "elb-weber-sg" {
  name        = "elb-weber-sg"
  description = "Allow inbound traffic on port 80"
  vpc_id      = "${aws_vpc.vpro-vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

}
