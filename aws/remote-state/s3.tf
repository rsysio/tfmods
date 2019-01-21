resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.account_name}-tfstate"
  acl    = "private"

  # statefile curruption safeguard
  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = "${var.tags}"
}
