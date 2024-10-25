resource "aws_codecommit_repository" "repo" {
  repository_name = var.repository_name
  description     = "CodeCommit repository for ${var.project_name}"
}

output "repository_name" {
  value = aws_codecommit_repository.repo.repository_name
}
