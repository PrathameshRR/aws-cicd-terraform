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

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # This is an example AMI ID, replace with an appropriate one for your region
}

variable "existing_codebuild_role_arn" {
  description = "ARN of an existing IAM role for CodeBuild"
  type        = string
  default     = ""
}

variable "existing_codedeploy_role_arn" {
  description = "ARN of an existing IAM role for CodeDeploy"
  type        = string
  default     = ""
}

variable "existing_codepipeline_role_arn" {
  description = "ARN of an existing IAM role for CodePipeline"
  type        = string
  default     = ""
}
