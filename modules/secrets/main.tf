resource "aws_secretsmanager_secret" "project_secrets" {
  name = "${var.project_name}-${var.environment}-secrets"
}

resource "aws_secretsmanager_secret_version" "project_secrets" {
  secret_id     = aws_secretsmanager_secret.project_secrets.id
  secret_string = jsonencode(var.secret_values)
}
