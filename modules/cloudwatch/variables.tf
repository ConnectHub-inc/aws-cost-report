variable "name" {
  description = "The name of the CloudWatch metric"
}

variable "schedule_expression" {
  description = "The schedule expression for the CloudWatch event rule"
}

variable "lambda_function_arn" {
  description = "The ARN of the Lambda function to trigger"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function to trigger"
}