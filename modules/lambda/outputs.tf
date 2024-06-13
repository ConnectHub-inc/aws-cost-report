output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.this.function_name
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.this.arn
}

output "lambda_role_arn" {
  description = "The ARN of the IAM role associated with the Lambda function"
  value       = aws_iam_role.this.arn
}
