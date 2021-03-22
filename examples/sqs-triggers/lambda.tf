locals {
 lambda_name = "<Lambda name>"
}

module "lambda" {
  source = "git@github.com:gstravinskaite/terraform-lambda.git"

  function_name              = local.lambda_name
  lambda_filename_s3_path    = var.s3_object_path
  lambda_file_s3_bucket_name = var.s3_name
  runtime                    = "<Runtime name>"
  handler                    = "<handler>"
  memory_size                = var.memory_size
  lambda_timeout             = 3
  concurrency                = -1
  log_retention              = 7 

  vpc_config = {
    security_group_ids = [<Lamba securit group>]
    subnet_ids         = var.vpc_private_subnets
  }

  event_sources = [
    {
      arn        = <SQS queue arn>
      enabled    = true
      batch_size = var.batch_size
    }
  ]

  environment = {
    RECORD_JDBC_URL    = ""
    SSM_PS_DB_USERNAME = ""
    SSM_PS_DB_PASSWORD = ""
    OUTPUT_BUCKET      = ""
    S3_OBJECT_PATH     = ""
  }

  lambda_iam_managed_policy_arns = [
    "<A comma separated list of the relevant IAM policy arns>"
  ]
}
