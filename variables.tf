variable name {
  description = "The name of the CloudWatch metric"
}

variable schedule_expression {
  description = "The schedule expression for the CloudWatch event rule"
}

variable slack_token {
  description = "The Slack token for authentication"
}

variable slack_channel {
  description = "The Slack channel to post messages to"
}

variable build_version {
  description = "The version of the build, used in the S3 key path"
}

variable runtime {
  description = "The runtime environment for the Lambda function"
}

variable timeout {
  description = "The timeout for the Lambda function"
  default     = 60
}
