# iam-policy.tf

data "template_file" "mydata"{
  template = file("s3-iam-policy.json")
  vars = {
    bucket_name = "${var.bucket_name}-${var.env}"
  }
}

output "name" {
  value = data.template_file.mydata.rendered 
}