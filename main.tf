terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  environment = terraform.workspace
}

# Include other module definitions here
module "s3" {
  source      = "./modules/s3"
  bucket_name = "${var.project_name}-${local.environment}-artifacts"
}

module "iam" {
  source              = "./modules/iam"
  project_name        = var.project_name
  artifact_bucket_arn = module.s3.bucket_arn
}

module "codecommit" {
  source          = "./modules/codecommit"
  repository_name = "${var.project_name}-${local.environment}"
  project_name    = var.project_name
}

module "codebuild" {
  source         = "./modules/codebuild"
  project_name   = "${var.project_name}-${local.environment}"
  iam_role_arn   = module.iam.codebuild_role_arn
  s3_bucket_id   = module.s3.bucket_id
}

module "ec2" {
  source        = "./modules/ec2"
  project_name  = var.project_name
  instance_type = var.instance_type
  environment   = local.environment
  ami_id        = var.ami_id
}

module "codedeploy" {
  source                = "./modules/codedeploy"
  app_name              = var.codedeploy_app_name
  deployment_group_name = var.codedeploy_group_name
  service_role_arn      = module.iam.codedeploy_role_arn
  environment           = local.environment
  project_name          = var.project_name
}

module "codepipeline" {
  source                 = "./modules/codepipeline"
  project_name           = "${var.project_name}-${local.environment}"
  iam_role_arn           = module.iam.codepipeline_role_arn
  s3_bucket_id           = module.s3.bucket_id
  repository_name        = module.codecommit.repository_name
  branch_name            = var.branch_name
  codebuild_project_name = module.codebuild.project_name
  codedeploy_app_name    = module.codedeploy.app_name
  codedeploy_group_name  = module.codedeploy.deployment_group_name
  sns_topic_arn          = module.sns.topic_arn
}

# Add this with the other module definitions

module "sns" {
  source       = "./modules/sns"
  project_name = var.project_name
}

module "cloudwatch" {
  source       = "./modules/cloudwatch"
  project_name = var.project_name
  instance_id  = module.ec2.instance_id
  sns_topic_arn = module.sns.topic_arn
}
