terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

module "lambda" {
  source         = "./modules/lambda"
  name           = var.name
  slack_token    = var.slack_token
  slack_channel  = var.slack_channel
  build_version  = var.build_version
  runtime        = var.runtime
  timeout        = var.timeout
}

module "cloudwatch" {
  source              = "./modules/cloudwatch"
  name                = var.name
  schedule_expression = var.schedule_expression
  lambda_function_name = module.lambda.lambda_function_name
  lambda_function_arn = module.lambda.lambda_function_arn
}