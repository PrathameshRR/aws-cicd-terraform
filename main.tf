terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region                      = var.aws_region
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    ec2            = "http://localhost:4566"
    es             = "http://localhost:4566"
    elasticache    = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    rds            = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    route53        = "http://localhost:4566"
    s3             = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
    codecommit     = "http://localhost:4566"
    codebuild      = "http://localhost:4566"
    codepipeline   = "http://localhost:4566"
    codedeploy     = "http://localhost:4566"
  }
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

module "codedeploy" {
  source                = "./modules/codedeploy"
  app_name              = var.codedeploy_app_name
  deployment_group_name = var.codedeploy_group_name
  service_role_arn      = module.iam.codedeploy_role_arn
  environment           = local.environment
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
  sns_topic_arn          = module.sns.topic_arn  # Add this line
}

# Add this with the other module definitions

module "sns" {
  source       = "./modules/sns"
  project_name = var.project_name
}
