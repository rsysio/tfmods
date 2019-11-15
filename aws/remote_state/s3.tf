resource "aws_s3_bucket" "remote_state" {
  bucket = "${var.bucket_name_prefix}-tfstate"
  acl    = "private"

  # statefile curruption safeguard
  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.tags
}
