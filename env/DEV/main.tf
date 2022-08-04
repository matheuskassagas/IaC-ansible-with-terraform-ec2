module "aws-dev" {
  source        = "../../infra"
  instance_type = "t2.micro"
  region_aws    = "us-east-1"
  key_ssh       = "IaC-Dev"
  grupoDeSeguranca = "DEV"  
  minimo = 0
  maximo = 1
  nomeGrupo = "DEV"
  producao = false
} 