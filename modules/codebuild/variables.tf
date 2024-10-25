variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "iam_role_arn" {
  description = "The ARN of the IAM role for CodeBuild"
  type        = string
}

variable "s3_bucket_id" {
  description = "The ID of the S3 bucket for artifacts"
  type        = string
}
