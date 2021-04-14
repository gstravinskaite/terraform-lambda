variable "code_tf_managed" {
  description = "Controls the type of lambda - with or without lifeycle setting"
  type = bool
  default = false
}

variable "function_name" {
  description = "A unique name for your Lambda Function."
  type        = string
}

variable "lambda_file_s3_bucket_name" {
  description = "The S3 bucket name where lambda file is saved."
  type        = string
}

variable "lambda_filename_s3_path" {
  description = "The lambda file path location in S3 bucket."
  type        = string
}

variable "description" {
  default     = ""
  description = "Description of what your Lambda Function does."
  type        = string
}
variable "runtime" {
  description = "See Runtimes for valid values."
  type        = string
}
variable "handler" {
  description = "The function entrypoint in your code."
  type        = string
}
variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128."
  type        = number
}
variable "concurrency" {
  description = "The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. "
  type        = number
}
variable "lambda_timeout" {
  default     = 5
  description = "The amount of time your Lambda Function has to run in seconds. Defaults to 5"
  type        = number
}

variable "vpc_config" {
  default     = null
  description = "Provide this to allow your function to access your VPC. Fields documented below. See Lambda in VPC."
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
}

variable "environment" {
  default     = null
  description = "The Lambda environment's configuration settings."
  type        = map(string)
}

variable "publish" {
  default     = false
  description = "Whether to publish creation/change as new Lambda Function Version. Defaults to true."
  type        = bool
}

variable "lambda_iam_policy" {
  description = "IAM policy template which will be used with IAM Role of lambda."
  type        = string
  default     = null
}

variable "lambda_iam_managed_policy_arns" {
  description = "IAM managed policy ARNs which will be used with IAM Role of lambda."
  type        = list(string)
  default     = []
}

variable "log_retention" {
  default     = 0
  description = "Specifies the number of days you want to retain log events in the specified log group. 0 indicates the logs never expire"
  type        = number
}

variable "iam_role_path" {
  description = "The path to the role. See IAM Identifiers for more information."
  type        = string
  default     = "/"
}

#--------------------------------------------------------------
# Event Source Variables
#--------------------------------------------------------------
variable "event_sources" {
  description = "One or more event sources represented as ARNs."
  type = list(object({
    arn        = string
    enabled    = bool
    batch_size = number
  }))
  default = []
}

#--------------------------------------------------------------
# Tag Variables
#--------------------------------------------------------------
variable "tag_product" {
  description = "Assigned in design phase. Is likely to span multiple AWS accounts."
  type        = string
}

variable "tag_sub_product" {
  description = "Assigned in design phase. Used where an AWS account runs more than one service."
  type        = string
}

variable "tag_contact" {
  description = "Specifies the group email address of the team responsible for the support of this resource."
  type        = string
}

variable "tag_cost_code" {
  description = "Track costs to align with various costing sources: cost centre, project code, PnL budget."
  type        = string
}

variable "tag_environment" {
  description = "Environment consists of 2 segments, separated by a dash. First segment: environment category (prod, dev or test). Second segment: Free form name to further describe the function of the environment."
  type        = string
}

variable "tag_orchestration" {
  description = "Path to Git for control repository."
  type        = string
}

variable "tag_description" {
  description = "A tag to describe what the resource is/does, such as the applications it runs."
  type        = string
}

variable "extra_tags" {
  description = "An optional map of tags to add to aws resources."
  type        = map(string)
  default     = {}
}
