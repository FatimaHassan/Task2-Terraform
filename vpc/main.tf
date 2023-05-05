resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnets" {
 count             = length(var.public_subnet_cidrs)
 vpc_id            = aws_vpc.my_vpc.id
 cidr_block        = element(var.public_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 
 tags = {
   Name = "${var.vpc_name}-Public Subnet ${count.index + 1}"
 }
}

resource "aws_subnet" "private_subnets" {
 count      = length(var.private_subnet_cidrs)
 vpc_id     = aws_vpc.my_vpc.id
 cidr_block = element(var.private_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 
 tags = {
   Name = "${var.vpc_name}-Private Subnet ${count.index + 1}"
 }
}

resource "aws_internet_gateway" "igw" {
 vpc_id = aws_vpc.my_vpc.id
 
 tags = {
   Name = "${var.vpc_name}-Internet Gateway"
 }
}

resource "aws_route_table" "my_rt" {
 vpc_id = aws_vpc.my_vpc.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.igw.id
 }
 
 tags = {
   Name = "${var.vpc_name}-Route Table"
 }
}