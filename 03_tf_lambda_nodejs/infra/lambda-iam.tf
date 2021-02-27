# iam.tf
resource "aws_iam_role_policy" "lambda_policy" {
  name = "${var.env}_lambda_policy"
  role = aws_iam_role.lambda_role.id
  policy = file("iam/lambda-policy.json")
}

resource "aws_iam_role" "lambda_role" {
  name = "${var.env}_lambda_role"
  assume_role_policy = file("iam/lambda-assume-policy.json")
}