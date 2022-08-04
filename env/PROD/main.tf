module "aws-prod" {
  source        = "../../infra"
  instance_type = "t2.micro"
  region_aws    = "us-east-1"
  key_ssh       = "IaC-Prod"
  grupoDeSeguranca = "Producao"
  minimo = 1
  maximo = 10
  nomeGrupo = "Prod"
  producao = true
} 