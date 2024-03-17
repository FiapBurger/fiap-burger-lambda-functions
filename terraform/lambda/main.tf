# terraform/lambda/main.tf

resource "aws_lambda_function" "fiapburger" {
  function_name = "fiapburger_lambda_function"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"

  s3_bucket = "my_lambda_functions_bucket"
  s3_key    = "lambda_function.zip"

  role = aws_iam_role.lambda_exec_role.arn
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}
