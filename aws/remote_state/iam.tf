data "aws_iam_policy_document" "tfstate" {
  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "${aws_s3_bucket.remote_state.arn}",
    ]
  }

  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.remote_state.arn}/*",
    ]
  }

  statement {
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem",
    ]

    resources = [
      "${aws_dynamodb_table.terraform_statelock.arn}",
    ]
  }
}

resource "aws_iam_role" "tfstate " {
  assume_role_policy = "${data.aws_iam_policy_document.tfstate.id}"
}
