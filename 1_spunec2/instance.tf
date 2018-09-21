provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "pluto" {
  ami = "ami-0ff8a91507f77f867"
  instance_type = "t2.micro"
}

