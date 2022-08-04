#!/bin/bash

cd /home/ubuntu # #  acessa o diretorio 
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py # # baixa o pacote do pip
sudo python3 get-pip.py # # instala python pip
sudo python3 -m pip install ansible # # instala o ansible 

# # Cria um arquivo em dev/null valor dentro de <<EOT
tee -a playbook.yml > /dev/null <<EOT 
- hosts: terraform-ansible
  tasks:
  - name: Instalando o python3, virtualenv
    apt:
      pkg: # # pacotes
      - python3
      - virtualenv
      update_cache: yes # # atualizar os pct 
    become: true # # execulte como root 
  - name: Instalando dependencias com pip (Django e Django Rest)
    pip:
      virtualenv: /home/ubuntu/tcc/venv
      name: # # pcts
        - django
        - djangorestframework
  - name: Verificando se o projeto ja existe
    start:
      path: /home/ubuntu/tcc/setup/settings.py
    register: projeto
  - name: Iniciando o projeto
    shell: '. /home/ubuntu/tcc/venv/bin/activate; django-admin startproject setup /home/ubuntu/tcc/'
    when: not projeto.stat.exists
  - name: Alterando o hosts do settings
    lineinfile: # # acesar uma linha de codigo para alteracao
      path: /home/ubuntu/tcc/setup/settings.py # # caminho
      regexp: 'ALLOWED_HOSTS' # # especificando onde
      line: 'ALLOWED_HOSTS = ["*"]' # # alterar para 
      backrefs: yes
EOT
ansible-playbook playbook.yml 