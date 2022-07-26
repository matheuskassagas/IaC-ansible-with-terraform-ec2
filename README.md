# Conexao com EC2 - aws_key_pair
- Este recurso requer um par de chaves fornecido pelo usuário existente. A chave pública desse par de chaves será registrada na AWS para permitir o login em instâncias do EC2. Ao gerar o par de chave na aws deve-se colar no arquivo **key.pem**

**Necessario Security Groups**

**NA AWS**
~> Conecte na instancia ~> Cliente SSH
```
chmod 400 key.pem
ssh -i "key.pem" ubuntu@<ip_public_dns>
```

**Necessario subir a instancia EC2 antes**
# Como execultar o playbook 
```
ansible-playbook playbook.yml -u ubuntu --private-key key.pem -i hosts.yml
```

# Gerar Chave para prod e dev
```
ssh-keygen
$<nomechave>
```

```
resource "aws_key_pair" "chaveDEV" {
  key_name   = "DEV"
  public_key = file("../DEV/IaC-DEV.pub")
}
```