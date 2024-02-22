
#We have an S3 bucket with some uploaded NodeJS code within, call the bucket “Deployment” and the zipped up code “build.zip”.
#Could you provide a basic terraform setup (including all relevant file names) that would create 3 lambdas call them 
#(“Service1”, “Service2”, “Service3”) all running the build.zip code. The handler of each lambda should correspond to 
#the name of the lambda, e.g. Service1.lambdaHandler, etc.


provider "aws" {
  region = "aws_region"
}

resource "aws_lambda_function" "service1" {
  function_name    = "Service1"
  role             = aws_iam_role.lambda.arn
  handler          = "Service1.lambdaHandler"
  runtime          = "nodejs14.x"
  filename         = "build.zip"
  source_code_hash = filebase64("build.zip")
}

resource "aws_lambda_function" "service2" {
  function_name    = "Service2"
  role             = aws_iam_role.lambda.arn
  handler          = "Service2.lambdaHandler"
  runtime          = "nodejs14.x"
  filename         = "build.zip"
  source_code_hash = filebase64("build.zip")
}

resource "aws_lambda_function" "service3" {
  function_name    = "Service3"
  role             = aws_iam_role.lambda.arn
  handler          = "Service3.lambdaHandler"
  runtime          = "nodejs14.x"
  filename         = "build.zip"
  source_code_hash = filebase64("build.zip")
}
