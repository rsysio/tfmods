resource "aws_iam_role" "kiam" {

  name = var.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
        Action    = "sts:AssumeRole"
      },
      {
        Effect    = "Allow"
        Principal = { AWS = var.server_role_arn }
        Action    = "sts:AssumeRole"
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_policy" "kiam" {
  name_prefix = "kiam-${var.name}-"
  policy      = var.role_policy
}

resource "aws_iam_role_policy_attachment" "kiam" {
  role       = aws_iam_role.kiam.name
  policy_arn = aws_iam_policy.kiam.arn
}
