# Upload Bot para GitHub

<h1 align="center">
<p>
<img src= "https://nexus-api.shop/v7g34m.jpg" alt="ANGEL BASE" width="720">
</p>

<p align="center">
<a href="#"><img title="BOT-MULTI-DEVICE" src="https://img.shields.io/badge/BOT•MULTI•DEVICE-blue?&style=for-the-badge"></a>
</p>

<p align="center">
<img title="Autor" src="https://img.shields.io/badge/Autor-@euyato-orange.svg?style=for-the-badge&logo=github"></a>
<img title="Versão" src="https://img.shields.io/badge/Versão-2.5-orange.svg?style=for-the-badge&logo=github"></a>
</p>

Automatize o envio do seu projeto para o GitHub diretamente pelo Termux ou qualquer terminal Linux!

---

## Como usar

1. **Baixe o arquivo `upload-bot.sh`** e jogue dentro do projeto que você quer upar.

2. **Configure suas credenciais** dentro do `upload-bot.sh`:
   
   ```sh
   GITHUB_USER="SeuUserAqui"    # Seu usuário do GitHub
   REPO_NAME="SeuRepoAqui"      # Nome do repositório
   TOKEN="SeuTokenAqui"         # Token de acesso pessoal do GitHub
   COMMIT_MESSAGE="Atualização do bot"
   BRANCH="main"                # Nome do branch (troque se necessário)
   ```

3. **Acesse a pasta do projeto** onde você colocou o script:

   ```bash
   cd /caminho/do/seu/projeto
   ```

4. **Execute o script**:
   
   ```bash
   sh upload-bot.sh
   ```
---

## O que o script faz?

- Verifica se a pasta é um repositório Git.
  - Se **não for**, inicializa e configura o `remote` para o GitHub.
- Verifica se o Git está configurado (nome e e-mail).
  - Se **não estiver**, solicita a configuração.
- Adiciona todos os arquivos (`git add .`).
- Faz um commit com a mensagem definida.
- Envia (`git push`) para o repositório remoto.

---

## Requisitos

- Git instalado.
- Acesso ao Termux ou terminal Linux.
- Token do GitHub com permissões de repositório.

---

## Observações

- O token é inserido diretamente na URL de envio, então **não compartilhe seu script publicamente**.
- Prefira tokens com permissões limitadas para aumentar a segurança.

---
