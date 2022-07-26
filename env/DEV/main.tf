module "aws_dev" {
  source = "../../infra"
  instance_type = "t2.micro"
  region_aws = "us-west-2"
  key_ssh = "Iac-DEV"

  tags = local.common_tags
} 