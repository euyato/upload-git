# Upload Bot para GitHub

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

   > **Exemplo de configuração:**
   >
   > ![Imagem da configuração das credenciais](./imagens/credenciais.png)

3. **Dê permissão de execução ao script** (se necessário):
   
   ```bash
   chmod +x upload-bot.sh
   ```

4. **Acesse a pasta do projeto** onde você colocou o script:

   ```bash
   cd /caminho/do/seu/projeto
   ```

5. **Execute o script**:
   
   ```bash
   sh upload-bot.sh
   ```

   > **Exemplo de execução no Termux:**
   >
   > ![Imagem da execução no Termux](./imagens/termux.png)

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

## Autor

- Feito por **Yato**.

---
