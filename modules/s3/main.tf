resource "aws_s3_bucket" "artifacts" {
  bucket = var.bucket_name
  force_destroy = true  # Add this line for easy cleanup in LocalStack
}

resource "aws_s3_bucket_versioning" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

output "bucket_id" {
  value = aws_s3_bucket.artifacts.id
}

output "bucket_arn" {
  value = aws_s3_bucket.artifacts.arn
}
