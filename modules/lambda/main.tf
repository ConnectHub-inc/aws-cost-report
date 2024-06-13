resource "aws_lambda_function" "this" {
  function_name = var.name
  runtime       = var.runtime
  handler       = "bootstrap"
  memory_size   = 512
  timeout       = var.timeout
  s3_bucket     = "tetsuya28-aws-cost-report"
  s3_key        = "${var.build_version}/main.zip"
  role          = aws_iam_role.this.arn
  environment {
    variables = {
      "SLACK_TOKEN"   = var.slack_token
      "SLACK_CHANNEL" = var.slack_channel
    }
  }
}

resource "aws_iam_role" "this" {
  name = var.name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "this" {
  name        = var.name
  path        = "/"
  description = "IAM policy for lambda"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}