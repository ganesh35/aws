locals {
  lambda_zip_location = "../outputs/unused-eips.zip"
}

# Archive a single file.
data "archive_file" "welcome" {
  type        = "zip"
  source_file = "../src/unused-eips.py"
  output_path = local.lambda_zip_location
}

resource "aws_lambda_function" "unused_eips" {
  filename      = local.lambda_zip_location
  function_name = "unused-eips-demo"
  role          = aws_iam_role.unused_eips_role.arn
  handler       = "unused-eips.lambda_handler"

  source_code_hash = filebase64sha256(local.lambda_zip_location)

  runtime = "python3.8"
  environment {
    variables = {
      SOURCE_EMAIL = "ganesh35@gmail.com",
      TARGET_EMAIL = "ganesh35@gmail.com"
    }
  }

}


# Schedule Lambda Function
resource "aws_cloudwatch_event_rule" "unused_eips" {
  name = "${var.env}_cwer_for_unused_eips"
  description = "find unused eips"
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "unused_eips" {
  rule = aws_cloudwatch_event_rule.unused_eips.name
  target_id = "SendUnusedEIPs"
  arn = aws_lambda_function.unused_eips.arn
}

# Allow cloudwatch to invoke lambda function

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id = "AllowExecutionFromCloudWatch"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.unused_eips.function_name
  principal = "events.amazonaws.com"
  source_arn = aws_cloudwatch_event_rule.unused_eips.arn
}