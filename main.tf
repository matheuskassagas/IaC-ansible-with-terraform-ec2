terraform {
  required_version = "1.2.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.19.0"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "default"
}

resource "aws_instance" "app_server"{
  ami           = "ami-03d5c68bab01f3496"
  instance_type = "t2.micro"
  key_name      = "key"         # # chave para acessar instancia EC2 
  user_data     = local.path_sh # # Script que ira ser execultado dentro da instancia
  security_groups = [aws_security_group.ec2.id]
  
  tags = {
    Name = "Ansible with Terraform"
  }
}