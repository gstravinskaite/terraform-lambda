resource "aws_iam_role" "lambda_permissions_role" {
  name               = format("%s-role", var.function_name)
  path               = var.iam_role_path
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Sid": "AllowLambdatoAssumeRole"
    }
  ]
}
EOF

  managed_policy_arns = var.lambda_iam_managed_policy_arns

  tags = local.tags_map
}

resource "aws_iam_role_policy" "inline_policy" {
  count  = var.lambda_iam_policy == null ? 0 : 1
  name   = format("%s_lambda_iam_role_policy", var.function_name)
  role   = aws_iam_role.lambda_permissions_role.id
  policy = var.lambda_iam_policy

  lifecycle {
    create_before_destroy = true
  }
}
