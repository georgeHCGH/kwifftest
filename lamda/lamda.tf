
#We have an S3 bucket with some uploaded NodeJS code within, call the bucket “Deployment” and the zipped up code “build.zip”.
#Could you provide a basic terraform setup (including all relevant file names) that would create 3 lambdas call them 
#(“Service1”, “Service2”, “Service3”) all running the build.zip code. The handler of each lambda should correspond to 
#the name of the lambda, e.g. Service1.lambdaHandler, etc.


provider "aws" {
  region = "your_aws_region"
}

data "archive_file" "lambda_code" {
  type        = "zip"
  source_dir  = "aws_s3_bucket.Deployment" #maybe url to bucket would work here
  source_file = "build.zip"
  output_path = "build.zip"
}


resource "aws_lambda_function" "service1" {
  function_name    = "Service1"
  role             = aws_iam_role.lambda.arn
  s3_bucket        = "var.bucket_name"
  s3_key           = "var.key"
  handler          = "Service1.lambdaHandler"
  runtime          = "nodejs14.x"
  filename         = "build.zip"
}

resource "aws_lambda_function" "service2" {
  function_name    = "Service2"
  s3_bucket        = "var.bucket_name"
  s3_key           = "var.key"
  role             = aws_iam_role.lambda.arn
  handler          = "Service2.lambdaHandler"
  runtime          = "nodejs14.x"
  filename         = "build.zip"
}

resource "aws_lambda_function" "service3" {
  function_name    = "Service3"
  s3_bucket        = "var.bucket_name"
  s3_key           = "var.key"
  role             = aws_iam_role.lambda.arn
  handler          = "Service3.lambdaHandler"
  runtime          = "nodejs14.x"
  filename         = "build.zip"
}
