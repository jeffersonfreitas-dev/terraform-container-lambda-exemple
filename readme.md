# 🐍 Lambda Container com Terraform e GitHub Actions

Este projeto provisiona uma função **AWS Lambda baseada em container Docker**, utilizando:

- ✅ **Python** como linguagem da Lambda
- 🐳 **Docker** para empacotamento da função
- ☁️ **Amazon ECR** como repositório de imagens
- ⚙️ **Terraform** para infraestrutura como código
- 🤖 **GitHub Actions** para CI/CD automatizado

---

## 📁 Estrutura do projeto
.
├── app/
  └── main.py # Código da função Lambda
├── Dockerfile # Empacotamento da função em container
├── terraform/
  ├── main.tf # Infraestrutura com ECR, Lambda, IAM
  ├── variables.tf # Variáveis reutilizáveis
  └── outputs.tf # Saídas úteis do Terraform
└── .github/
  └── workflows/
  └── deploy.yml # CI/CD: Build + Push + Apply

## 🚀 Como funciona

1. Código Python em `app/main.py`
2. Dockerfile empacota tudo em uma imagem baseada no runtime do Lambda
3. GitHub Actions:
   - Faz o `docker build`
   - Faz `push` para o Amazon ECR
   - Roda `terraform apply` apontando para a imagem publicada
4. Lambda é criada (ou atualizada) automaticamente via Terraform

---

## 🛠️ Pré-requisitos

- Conta AWS válida
- Docker instalado (para testes locais, opcional)
- Terraform instalado (v1.0+)
- GitHub Secrets configurados (veja abaixo)

---

## 🔐 GitHub Secrets necessários

Configure no repositório do GitHub:

| Nome                | Descrição                                |
|---------------------|--------------------------------------------|
| `AWS_ACCESS_KEY_ID`     | Chave de acesso da AWS                   |
| `AWS_SECRET_ACCESS_KEY` | Segredo da chave da AWS                  |
| `AWS_REGION`            | Região AWS (ex: `us-east-1`)             |
| `ECR_REPOSITORY`        | Nome do repositório no ECR               |
| `ECR_ACCOUNT_ID`        | ID da conta AWS (ex: `123456789012`)     |

---

## 🧪 Testar localmente (opcional)

```bash
# Build local
docker build -t meu-lambda-container .

# Teste local com AWS Lambda base
docker run -p 9000:8080 meu-lambda-container

# Em outro terminal:
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'