variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "iam_role_arn" {
  description = "The ARN of the IAM role for CodePipeline"
  type        = string
}

variable "s3_bucket_id" {
  description = "The ID of the S3 bucket for artifacts"
  type        = string
}

variable "repository_name" {
  description = "The name of the CodeCommit repository"
  type        = string
}

variable "branch_name" {
  description = "The branch name to trigger the pipeline"
  type        = string
}

variable "codebuild_project_name" {
  description = "The name of the CodeBuild project"
  type        = string
}

variable "codedeploy_app_name" {
  description = "The name of the CodeDeploy application"
  type        = string
}

variable "codedeploy_group_name" {
  description = "The name of the CodeDeploy deployment group"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN of the SNS topic for alarm notifications"
  type        = string
}
