terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"

    }
  }
  backend "s3" {
    bucket         = "terraform-state-bucket-api-1234" # Change this to your unique bucket name
    key            = "terraform.tfstate"
    region         = "us-east-1" # Change this to your desired region
    encrypt        = true

  }

}

provider "aws" {
  region = var.region

}