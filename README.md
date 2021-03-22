# lambda

## Overview

A module used for configuring lambda function together with its IAM role and CloudWatch log group. The module relies on the lambda function being stored in S3 bucket. Enabling lambda access to the VPC is also a possible configuration.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_cloudwatch_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) |
| [aws_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) |
| [aws_lambda_event_source_mapping](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_event_source_mapping) |
| [aws_lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) |
| [aws_s3_bucket_object](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket_object) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| concurrency | The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. | `number` | n/a | yes |
| description | Description of what your Lambda Function does. | `string` | `""` | no |
| environment | The Lambda environment's configuration settings. | `map(string)` | `null` | no |
| event\_sources | One or more event sources represented as ARNs. | <pre>list(object({<br>    arn        = string<br>    enabled    = bool<br>    batch_size = number<br>  }))</pre> | `[]` | no |
| extra\_tags | An optional map of tags to add to aws resources. | `map(string)` | `{}` | no |
| function\_name | A unique name for your Lambda Function. | `string` | n/a | yes |
| handler | The function entrypoint in your code. | `string` | n/a | yes |
| iam\_role\_path | The path to the role. See IAM Identifiers for more information. | `string` | `"/"` | no |
| lambda\_file\_s3\_bucket\_name | The S3 bucket name where lambda file is saved. | `string` | n/a | yes |
| lambda\_filename\_s3\_path | The lambda file path location in S3 bucket. | `string` | n/a | yes |
| lambda\_iam\_managed\_policy\_arns | IAM managed policy ARNs which will be used with IAM Role of lambda. | `list(string)` | `[]` | no |
| lambda\_iam\_policy | IAM policy template which will be used with IAM Role of lambda. | `string` | `null` | no |
| lambda\_timeout | The amount of time your Lambda Function has to run in seconds. Defaults to 5 | `number` | `5` | no |
| log\_retention | Specifies the number of days you want to retain log events in the specified log group. 0 indicates the logs never expire | `number` | `0` | no |
| memory\_size | Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128. | `number` | n/a | yes |
| publish | Whether to publish creation/change as new Lambda Function Version. Defaults to true. | `bool` | `false` | no |
| runtime | See Runtimes for valid values. | `string` | n/a | yes |
| tag\_contact | Specifies the group email address of the team responsible for the support of this resource. | `string` | n/a | yes |
| tag\_cost\_code | Track costs to align with various costing sources: cost centre, project code, PnL budget. | `string` | n/a | yes |
| tag\_description | A tag to describe what the resource is/does, such as the applications it runs. | `string` | n/a | yes |
| tag\_environment | Environment consists of 2 segments, separated by a dash. First segment: environment category (prod, dev or test). Second segment: Free form name to further describe the function of the environment. | `string` | n/a | yes |
| tag\_orchestration | Path to Git for control repository. | `string` | n/a | yes |
| tag\_product | Assigned in design phase. Is likely to span multiple AWS accounts. | `string` | n/a | yes |
| tag\_sub\_product | Assigned in design phase. Used where an AWS account runs more than one service. | `string` | n/a | yes |
| vpc\_config | Provide this to allow your function to access your VPC. Fields documented below. See Lambda in VPC. | <pre>object({<br>    security_group_ids = list(string)<br>    subnet_ids         = list(string)<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | Lambda ARN |
| cloudwatch\_logs\_name | Cloudwatch log group name |
| invoke\_arn | ARN to invoke the lambda method |
| name | Lambda Name |
| version | Lambda Version |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
