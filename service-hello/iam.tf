resource "aws_iam_role" "this" {
  name = "ServiceHelloRole"
  assume_role_policy = jsonencode({
  })
}


resource "aws_iam_role" "role_for_service_hello" {
  name = "ServiceHelloRole"
  assume_role_policy = jsonencode({
  })
}





