variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "instance_id" {
  description = "The EC2 instance ID to monitor"
  type        = string
}

variable "sns_topic_arn" {
  description = "The ARN of the SNS topic for alarm notifications"
  type        = string
}
