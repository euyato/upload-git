# Upload para o GitHub

<h1 align="center">
<p>
<img src= "https://files.catbox.moe/jijqo6.jpg" alt="UPLOAD" width="720">
</p>

<p align="center">
<a href="#"><img title="SCRIPT-BASH" src="https://img.shields.io/badge/SCRIPT•BASH-blue?&style=for-the-badge"></a>
</p>

<p align="center">
<img title="Autor" src="https://img.shields.io/badge/Autor-@euyato-orange.svg?style=for-the-badge&logo=github"></a>

Automatize o envio do seu projeto para o GitHub diretamente pelo Termux ou qualquer terminal Linux

---

## Como usar

1. **Baixe o arquivo `upload-bot.sh`** e jogue dentro do projeto que você quer upar.

2. **Configure suas credenciais** dentro do `upload-bot.sh`:
   
   ```sh
   GITHUB_USER="SeuUserAqui" # Seu usuário do GitHub
   REPO_NAME="SeuRepoAqui" # Nome do repositório
   TOKEN="SeuTokenAqui" # Token de acesso pessoal do GitHub
   COMMIT_MESSAGE="Atualização do bot"
   BRANCH="main" # Nome do branch (troque se necessário)
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
- Se houver erro no enviou, o proprio terminal fornece o link para confirmar que a engano e o repositorio nao compartilha nada privado.
- Copie e cole o link fornecido no Chrome, marque a primeira opção e confirme. logo após volte no terminal e execute: git push origin main
- Pronto, seu repositorio estará no GitHub.

---
