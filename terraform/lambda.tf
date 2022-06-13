locals {
  lambda-zip-location = "outputs/functionbasic.zip"
}

data "archive_file" "init" {
    type = "zip"
    source_file = "../functionbasic.py"
    output_path = local.lambda-zip-location
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  filename      = local.lambda-zip-location
  function_name = "functionbasic"
  role          = aws_iam_role.lambda_role.arn
  handler       = "functionbasic.hello"

#   source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "python3.8"

}