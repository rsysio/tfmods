resource "aws_kms_key" "remote_state" {
  description = "terraform remote state bucket key"

  tags = "${var.tags}"
}

resource "aws_kms_alias" "remote_state" {
  name          = "alias/tfstate"
  target_key_id = "${aws_kms_key.remote_state.id}"
}

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
    "rule" {
      "apply_server_side_encryption_by_default" {
        kms_master_key_id = "${aws_kms_key.remote_state.id}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = "${var.tags}"
}
