resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = "${var.project_name}-server"
    Environment = var.environment
  }
}

output "instance_id" {
  value = aws_instance.app_server.id
}
