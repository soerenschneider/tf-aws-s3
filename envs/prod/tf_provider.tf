terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.71.0"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "4.2.0"
    }
  }
}

provider "vault" {
  address = "https://vault.ha.soeren.cloud"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      repo       = "https://github.com/soerenschneider/tf-aws-s3"
      managed-by = "terraform"
    }
  }
}
