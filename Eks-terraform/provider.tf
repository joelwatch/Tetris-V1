terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Version du provider AWS
    }
  }

  required_version = ">= 1.0.0" # Version minimale de Terraform requise

  backend "remote" {
    organization = "ktech237" # Remplacez par le nom de votre organisation Terraform Cloud

    workspaces {
      name = "k-tech-staging" # Remplacez par le nom de votre workspace Terraform Cloud
    }
  }
}

provider "aws" {
  region = var.aws_region # La région AWS est définie par la variable `aws_region`
}