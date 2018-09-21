variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AL-AMI" {
  type = "map"
  default {
    us-east-1 = "ami-0ff8a91507f77f867"
    us-west-1 = "ami-a0cfeed8"
  }
}

variable "PUB_KEY" {
  default = "loginkey.pub"
}

variable "PRIV_KEY" {
  default = "loginkey"
}

variable "USERNAME" {
  default = "ec2-user"
}
