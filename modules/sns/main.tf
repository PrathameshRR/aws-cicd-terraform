resource "aws_sns_topic" "pipeline_notifications" {
  name = "${var.project_name}-pipeline-notifications"
}

output "topic_arn" {
  value = aws_sns_topic.pipeline_notifications.arn
}
