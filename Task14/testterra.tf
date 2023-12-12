provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "web" {
  ami           = "ami-0505148b3591e4c07"
  instance_type = "t2.micro"
    key_name = "terra"
  tags = {
    Name = "mahi"
  }
}
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "main1"
  }
}