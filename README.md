# Conexao com EC2 - aws_key_pair
- Este recurso requer um par de chaves fornecido pelo usuário existente. A chave pública desse par de chaves será registrada na AWS para permitir o login em instâncias do EC2. Ao gerar o par de chave na aws deve-se colar no arquivo **key.pem**

**Necessario Security Groups**

**NA AWS**
~> Conecte na instancia ~> Cliente SSH
```
chmod 400 key.pem
ssh -i "key.pem" ubuntu@..
```