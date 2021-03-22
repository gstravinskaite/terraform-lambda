resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = format("/aws/lambda/%s", var.function_name)
  retention_in_days = var.log_retention

  tags = merge(local.tags_map,
    { Function = format("%s", var.function_name) }
  )
}
