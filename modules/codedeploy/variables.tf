variable "app_name" {
  description = "Name of the CodeDeploy application"
  type        = string
}

variable "deployment_group_name" {
  description = "Name of the CodeDeploy deployment group"
  type        = string
}

variable "service_role_arn" {
  description = "ARN of the IAM service role for CodeDeploy"
  type        = string
}

variable "environment" {
  description = "Environment tag for EC2 instances"
  type        = string
}
