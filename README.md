# FiapBurger AWS Lambda Infrastructure

Este repositório contém a infraestrutura como código (IaC) para provisionar funções AWS Lambda que suportam o sistema FiapBurger, um sistema de gerenciamento de pedidos para uma lanchonete.


## Funcionalidades de Negócio

As funções AWS Lambda no projeto FiapBurger lidam com várias operações críticas, incluindo:

- **Processamento de Pedidos**: Manipula a criação e atualização de pedidos.
- **Gerenciamento de Clientes**: Gerencia as operações relacionadas a clientes, como cadastro e consulta de informações.
- **Integrações**: Conecta-se a outros serviços AWS ou APIs de terceiros para estender a funcionalidade, como enviar notificações ou processar pagamentos.

## Como Usar

### Pré-requisitos

- Terraform instalado.
- AWS CLI configurado com as credenciais apropriadas.
- Acesso à AWS com as permissões necessárias para criar funções Lambda e outros recursos relacionados.

### Configuração e Implantação

1. **Provisionar Funções Lambda**:
    - Navegue até `terraform/lambda`.
    - Execute `terraform init` para inicializar o Terraform.
    - Utilize `terraform plan` para revisar as mudanças planejadas.
    - Aplique a configuração com `terraform apply`.

2. **Deploy do Código da Função**:
    - O código da função Lambda em `src/lambda_function.py` precisa ser empacotado e carregado para um bucket S3, referenciado no Terraform para deploy.

### Atualizações

- Para atualizar a função Lambda, faça as alterações necessárias no código, reempacote e reenvie o arquivo `.zip` para o S3, e execute `terraform apply` para atualizar a infraestrutura.

## CI/CD

A pipeline de CI/CD automatiza:

- A verificação do código Terraform e a aplicação das mudanças na infraestrutura.
- O empacotamento e d
