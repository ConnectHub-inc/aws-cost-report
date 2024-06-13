variable "name" {
  description = "The name of the Lambda function"
}

variable "runtime" {
  description = "The runtime environment for the Lambda function"
}

variable "timeout" {
  description = "The timeout for the Lambda function"
  default     = 60
}

variable "build_version" {
  description = "The version of the build, used in the S3 key path"
}

variable "slack_token" {
  description = "The Slack token for authentication"
}

variable "slack_channel" {
  description = "The Slack channel to post messages to"
}
