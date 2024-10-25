resource "aws_codedeploy_app" "app" {
  name = var.app_name
}

resource "aws_codedeploy_deployment_group" "deployment_group" {
  app_name               = aws_codedeploy_app.app.name
  deployment_group_name  = var.deployment_group_name
  service_role_arn       = var.service_role_arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Environment"
      type  = "KEY_AND_VALUE"
      value = var.environment
    }
  }
}

output "app_name" {
  value = aws_codedeploy_app.app.name
}

output "deployment_group_name" {
  value = aws_codedeploy_deployment_group.deployment_group.deployment_group_name
}
