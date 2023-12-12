provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "qwerty" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "main1"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.qwerty.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "s1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.qwerty.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "s2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.qwerty.id
  cidr_block = "10.0.3.0/24"
availability_zone = "eu-west-2c"

  tags = {
    Name = "s3"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0505148b3591e4c07"
  instance_type = "t2.micro"
  key_name      = "terra"
  subnet_id = "aws_subnet.subnet1.id"
  tags = {
    Name = "m1"
  }
}

resource "aws_instance" "iop" {
  ami           = "ami-0505148b3591e4c07"
  instance_type = "t2.micro"
  key_name      = "terra"
  subnet_id = "aws_subnet.subnet2.id"
  tags = {
    Name = "m2"
  }
}
