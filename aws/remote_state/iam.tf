data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
    }
  }
}

resource "aws_iam_role" "tfstate" {
  name               = "tfstate"
  assume_role_policy = data.aws_iam_policy_document.assume.json
}

data "aws_iam_policy_document" "tfstate" {
  statement {
    actions = [
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.remote_state.arn
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
      aws_dynamodb_table.terraform_statelock.arn,
    ]
  }
}

resource "aws_iam_policy" "tfstate" {
  policy = data.aws_iam_policy_document.tfstate.json
}

resource "aws_iam_role_policy_attachment" "tfstate" {
  role       = aws_iam_role.tfstate.name
  policy_arn = aws_iam_policy.tfstate.arn
}
