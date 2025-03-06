module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "${var.prefix}-vpc"
  cidr   = var.vpc_cidr
  azs    = data.aws_availability_zones.available.names

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  database_subnets = var.database_subnets

  enable_dns_hostnames = true
}

resource "aws_security_group" "default" {
  vpc_id = module.vpc.vpc_id
  name   = "${var.prefix}-sg"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-default-sg"
  }
}

resource "aws_vpc_endpoint" "eks" {
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.region}.eks"
  route_table_ids = module.vpc.private_route_table_ids
}

resource "aws_vpc_endpoint" "ecr" {
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.region}.ecr.dkr"
  route_table_ids = module.vpc.private_route_table_ids
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.${var.region}.s3"
  route_table_ids = module.vpc.private_route_table_ids
}


/*
terraform plan \
  -var="prefix=my-prefix" \
  -var="vpc_cidr=10.0.0.0/16" \
  -var="public_subnets=[\"10.0.1.0/24\", \"10.0.2.0/24\"]" \
  -var="private_subnets=[\"10.0.3.0/24\", \"10.0.4.0/24\"]" \
  -var="database_subnets=[\"10.0.5.0/24\", \"10.0.6.0/24\"]" \
  -var="region=us-east-1"
*/