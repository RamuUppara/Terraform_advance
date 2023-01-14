terraform {
  backend "s3" {
    bucket = "tfstatebucketd"
    key    = "AMG_workspace_tfstate/"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}

provider "aws" {
  region = var.region
  profile = var.profile
}

