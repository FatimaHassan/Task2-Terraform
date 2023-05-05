provider "aws" {
	region = var.aws_region
}

module "Production_VPC" {
    source = "./vpc"
    vpc_name = "Production"
}

module "Staging_VPC" {
    source = "./vpc"
    vpc_name = "Staging"
    azs = ["eu-west-1a"]
}