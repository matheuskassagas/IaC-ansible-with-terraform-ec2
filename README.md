# Conexao com EC2 - aws_key_pair
- Este recurso requer um par de chaves fornecido pelo usuário existente. A chave pública desse par de chaves será registrada na AWS para permitir o login em instâncias do EC2.

* Necessario Security Groups

~> Conecte na instancia ~> Cliente SSH
```
chmod 400 key.pem
ssh -i "key.pem" ubuntu@..
```