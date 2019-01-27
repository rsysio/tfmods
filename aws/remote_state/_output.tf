output "s3_bucket_arn" {
  value = "${aws_s3_bucket.remote_state.arn}"
}

output "dynamodb_table_arn" {
  value = "${aws_dynamodb_table.terraform_statelock.arn}"
}
