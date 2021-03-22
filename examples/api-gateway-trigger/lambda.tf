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

  iam_role_path = "<iam path role>"
  lambda_iam_policy = templatefile("lambda-policy.json",
    {
      region      = var.aws_region
      account_id  = var.aws_account_id
      lambda_name = local.lambda_name
    }
  )

  tag_description = "<Tag description>"
}
