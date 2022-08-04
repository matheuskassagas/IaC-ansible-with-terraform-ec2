terraform {
  required_version = ">= 1.0.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.19.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region_aws
  endpoints {
    apigateway     = "http://localhost:4566/"
    apigatewayv2   = "http://localhost:4566/"
    cloudformation = "http://localhost:4566/"
    cloudwatch     = "http://localhost:4566/"
    dynamodb       = "http://localhost:4566/"
    ec2            = "http://localhost:4566/"
    es             = "http://localhost:4566/"
    elasticache    = "http://localhost:4566/"
    firehose       = "http://localhost:4566/"
    iam            = "http://localhost:4566/"
    kinesis        = "http://localhost:4566/"
    lambda         = "http://localhost:4566/"
    rds            = "http://localhost:4566/"
    redshift       = "http://localhost:4566/"
    route53        = "http://localhost:4566/"
    s3             = "http://s3.localhost.localstack.cloud:4566/"
    secretsmanager = "http://localhost:4566/"
    ses            = "http://localhost:4566/"
    sns            = "http://localhost:4566/"
    sqs            = "http://localhost:4566/"
    ssm            = "http://localhost:4566/"
    stepfunctions  = "http://localhost:4566/"
    sts            = "http://localhost:4566/"
  }
}


resource "aws_launch_template" "maquina" { # # Can be used to create instances or auto scaling groups
  image_id = "ami-03d5c68bab01f3496"
  instance_type = var.instance_type
  key_name = var.key_ssh
  tags = {
    Name = "Terraform Ansible Python"
  }
  security_group_names = [ var.grupoDeSeguranca ]
  user_data = filebase64("ansible.sh")
}


# resource "aws_instance" "app_server" {
#   ami           = "ami-03d5c68bab01f3496"
#   instance_type = var.instance_type
#   key_name      = var.key_ssh # # chave para acessar instancia EC2 
#   # user_data       = local.path_sh # # Script que ira ser execultado dentro da instancia
#   # security_groups = [aws_security_group.ec2_main.arn]
# }

resource "aws_key_pair" "chaveDEV" {
  key_name   = var.key_ssh
  public_key = file("${var.key_ssh}.pub")
}

resource "aws_autoscaling_group" "grupo" {
  availability_zones = [ "${var.region_aws}a", "${var.region_aws}b" ]
  name = var.nomeGrupo
  max_size = var.maximo
  min_size = var.minimo
  launch_template {
    id = aws_launch_template.maquina.id
    version = "$Latest"
  }
  target_group_arns = [ aws_lb_target_group.alvoLoadBalancer.arn ]
}