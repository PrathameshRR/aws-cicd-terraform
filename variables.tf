variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "my-cicd-project"
}

variable "repository_name" {
  description = "The name of the CodeCommit repository"
  type        = string
  default     = "my-app-repo"
}

variable "branch_name" {
  description = "The branch name to trigger the pipeline"
  type        = string
  default     = "main"
}

variable "codedeploy_app_name" {
  description = "The name of the CodeDeploy application"
  type        = string
  default     = "my-app"
}

variable "codedeploy_group_name" {
  description = "The name of the CodeDeploy deployment group"
  type        = string
  default     = "my-app-deployment-group"
}
