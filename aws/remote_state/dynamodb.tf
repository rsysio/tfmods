resource "aws_dynamodb_table" "terraform_statelock" {
  name           = var.dynamodb_table_name
  read_capacity  = var.dynamodb_read_capacity
  write_capacity = var.dynamodb_write_capacity
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = var.tags
}
