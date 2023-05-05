# Task2-Terraform
A Terraform module to create an Amazon Web Services (AWS) Virtual Private Cloud (VPC) for each Staging and Production environment along with Private and Public Subnet.
## Module VPC
A module is created for launching new VPC so it can be resued for Staging and Production environment. Following component are part of module VPC
* VPC
* Private Subnet
* Public Subnet
* Internet Gateway
* Route Table

### Variables
* ```vpc_cidr_block``` - CIDR Block for VPC (default: ```10.0.0.0/16```)
* ```vpc_name``` - Name of VPC (default: ```MainVPC```)
* ```public_subnet_cidrs``` - List of public subnet CIDR blocks (default: ```["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]```)
* ```private_subnet_cidrs``` - List of private subnet CIDR blocks (default: ```["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]```)
* ```azs``` - List of Availability Zones (default: ```["eu-west-1a", "eu-west-1b", "eu-west-1c"]```)

