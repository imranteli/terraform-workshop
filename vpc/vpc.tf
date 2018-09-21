resource "aws_vpc" "vpro-vpc" {
  cidr_block       = "172.20.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags {
    Name = "vprofile"
  }
}

resource "aws_subnet" "vpro-pub-1" {
  vpc_id     = "${aws_vpc.vpro-vpc.id}"
  cidr_block = "172.20.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags {
    Name = "vpro-pub-1"
  }
}
resource "aws_subnet" "vpro-pub-2" {
  vpc_id     = "${aws_vpc.vpro-vpc.id}"
  cidr_block = "172.20.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags {
    Name = "vpro-pub-2"
  }
}
resource "aws_subnet" "vpro-priv-1" {
  vpc_id     = "${aws_vpc.vpro-vpc.id}"
  cidr_block = "172.20.3.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags {
    Name = "vpro-priv-1"
  }
}
resource "aws_subnet" "vpro-priv-2" {
  vpc_id     = "${aws_vpc.vpro-vpc.id}"
  cidr_block = "172.20.4.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags {
    Name = "vpro-priv-2"
  }
}

resource "aws_internet_gateway" "vpro-igw" {
  vpc_id = "${aws_vpc.vpro-vpc.id}"

  tags {
    Name = "vpro-igw"
  }
}

resource "aws_route_table" "vpro-pub-rt" {
  vpc_id = "${aws_vpc.vpro-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpro-igw.id}"
  }

  tags {
    Name = "vpro-pub-rt"
  }
}

resource "aws_route_table_association" "vpro-pub1-rt-as" {
  subnet_id      = "${aws_subnet.vpro-pub-1.id}"
  route_table_id = "${aws_route_table.vpro-pub-rt.id}"
}


resource "aws_route_table_association" "vpro-pub2-rt-as" {
  subnet_id      = "${aws_subnet.vpro-pub-2.id}"
  route_table_id = "${aws_route_table.vpro-pub-rt.id}"
}
