terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = var.aws-profile
  region  = "us-east-1"
}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "poc-terraform"
  description   = "praticando criação de lambda com terraform"
  handler       = "lambda"
  runtime       = "go1.x"

  source_path = "../target/lambda"

  attach_cloudwatch_logs_policy     = false
  cloudwatch_logs_retention_in_days = 1

  tags = {
    Name        = "poc-aws-lambda-terraform"
    Environment = "dev"
    Language    = "go"
  }
}