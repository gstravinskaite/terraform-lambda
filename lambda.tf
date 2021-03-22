data "aws_s3_bucket_object" "lambda_artefact_bucket" {
  bucket = var.lambda_file_s3_bucket_name
  key    = var.lambda_filename_s3_path
}

resource "aws_lambda_function" "lambda_function" {
  function_name                  = var.function_name
  description                    = var.description
  role                           = aws_iam_role.lambda_permissions_role.arn
  handler                        = var.handler
  runtime                        = var.runtime
  publish                        = var.publish
  memory_size                    = var.memory_size
  reserved_concurrent_executions = var.concurrency
  timeout                        = var.lambda_timeout

  s3_bucket         = data.aws_s3_bucket_object.lambda_artefact_bucket.bucket
  s3_key            = data.aws_s3_bucket_object.lambda_artefact_bucket.key
  s3_object_version = data.aws_s3_bucket_object.lambda_artefact_bucket.version_id

  # lifecycle enables to push changes to lambda without causing drifts
  # the s3 object versions should still be updated once the final version of
  # the code it decided.
  lifecycle {
    ignore_changes = [s3_key, s3_object_version, handler]
  }

  tags = local.tags_map

  dynamic "vpc_config" {
    for_each = var.vpc_config == null ? [] : [var.vpc_config]
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
    }
  }

  dynamic "environment" {
    for_each = var.environment == null ? [] : [var.environment]
    content {
      variables = var.environment
    }
  }

  depends_on = [aws_cloudwatch_log_group.lambda_log_group]
}
