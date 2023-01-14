#########################################################
############# Roles_for_lambda ##########################

resource "aws_iam_role" "iaac_lambda_role" {
  name = "iaac_lambda_role"

  assume_role_policy = file("role.tpl")
}
resource "aws_iam_policy" "iaac_lambda_policy" {
  name = "iaac_lambda_policy"
  policy = file("policy.json")
}

resource "aws_iam_policy_attachment" "iaac_lambda_attach" {
  name       = "lambda-attachment"
  roles      = [aws_iam_role.iaac_lambda_role.name]
  policy_arn = aws_iam_policy.iaac_lambda_policy.arn
}

#########################################################
############# lambda_function_creation ##################

data "archive_file" "iaac_archive_file" {
  type = "zip"
  source_file = "python_function.py"
  output_path = "outputs/python_function.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "outputs/python_function.zip"
  function_name = "lambda_python_function"
  role          = aws_iam_role.iaac_lambda_role.arn
  handler       = "python_function.lambda_handler"
  source_code_hash = filebase64sha256(data.archive_file.iaac_archive_file.output_path)

  runtime = "python3.9"
}

resource "aws_lambda_permission" "iaac_lambda_permission" {
  statement_id = "AllowExecutionFromCloudWatch"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name
  principal = "events.amazonaws.com"
  source_arn = aws_cloudwatch_event_rule.iaac_event_bridge.arn
}

################################################################################
################## Event_bridge ############################

resource "aws_cloudwatch_event_rule" "iaac_event_bridge" {
  name        = "iaac_event_bridge_rule"
  schedule_expression = "rate(2 minutes)"
  event_bus_name = "default"
}
resource "aws_cloudwatch_event_target" "iaac_event_bridge_target" {
  arn  = aws_lambda_function.test_lambda.arn
  rule = aws_cloudwatch_event_rule.iaac_event_bridge.id
}
