# resource "aws_lambda_event_source_mapping" "lambda_event_source" {
#   for_each = { for eventsource in var.event_sources : eventsource.arn => eventsource }

#   function_name    = aws_lambda_function.lambda_function.arn
#   event_source_arn = each.value.arn
#   enabled          = each.value.enabled
#   batch_size       = each.value.batch_size
# }
