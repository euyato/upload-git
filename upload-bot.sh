#!/bin/bash

# ========== CONFIGURAÇÕES ==========
GITHUB_USER="SeuUserAqui" # Seu usuário do GitHub
REPO_NAME="SeuRepoAqui"  # Nome do repositório
TOKEN="SeuTokenAqui" # Token pessoal de acesso
BRANCH="main" # Nome do branch principal
COMMIT_MESSAGE_DEFAULT="Primeiro commit" # Mensagem padrão de commit
GIT_NAME="Seu usuario github" # Nome que aparecerá nos commits
GIT_EMAIL="seuemail@example.com" # Email que aparecerá nos commits
# ====================================

# ========== CORES ==========
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
RESET="\033[0m"
# ============================

set -e  # Para o script em caso de erro

# Função para instalar o Git se não existir
install_git() {
  if ! command -v git &>/dev/null; then
    echo -e "${YELLOW}Git não encontrado. Instalando...${RESET}"
    
    if command -v apt &>/dev/null; then
      sudo apt update && sudo apt install git -y
    elif command -v pkg &>/dev/null; then
      pkg update && pkg install git -y
    elif command -v yum &>/dev/null; then
      sudo yum install git -y
    else
      echo -e "${RED}Gerenciador de pacotes não suportado. Instale o Git manualmente.${RESET}"
      exit 1
    fi

    echo -e "${GREEN}Git instalado com sucesso!${RESET}"
  else
    echo -e "${GREEN}Git já instalado.${RESET}"
  fi
}

# Função para configurar Git LOCALMENTE
configure_git() {
  local current_name=$(git config user.name || echo "")
  local current_email=$(git config user.email || echo "")

  if [ "$current_name" != "$GIT_NAME" ] || [ "$current_email" != "$GIT_EMAIL" ]; then
    echo -e "${YELLOW}Configurando usuário Git localmente...${RESET}"
    git config user.name "$GIT_NAME"
    git config user.email "$GIT_EMAIL"
    echo -e "${GREEN}Git configurado como: $GIT_NAME <$GIT_EMAIL>${RESET}"
  else
    echo -e "${GREEN}Usuário Git já configurado corretamente: $current_name <$current_email>${RESET}"
  fi
}

# Função para inicializar repositório
initialize_repo() {
  echo -e "${YELLOW}Inicializando repositório Git...${RESET}"
  git init
  git branch -M "$BRANCH"
  git remote add origin "https://${GITHUB_USER}:${TOKEN}@github.com/${GITHUB_USER}/${REPO_NAME}.git"
  echo -e "${GREEN}Repositório inicializado e remote configurado.${RESET}"
}

# Função para atualizar o remote origin
update_remote() {
  local current_remote
  current_remote=$(git remote get-url origin 2>/dev/null || echo "")
  local expected_remote="https://${GITHUB_USER}:${TOKEN}@github.com/${GITHUB_USER}/${REPO_NAME}.git"

  if [ "$current_remote" != "$expected_remote" ]; then
    echo -e "${YELLOW}Atualizando remote origin...${RESET}"
    git remote remove origin 2>/dev/null || true
    git remote add origin "$expected_remote"
    echo -e "${GREEN}Remote origin atualizado.${RESET}"
  else
    echo -e "${GREEN}Remote origin já está correto.${RESET}"
  fi
}

# Função para commitar e enviar alterações
commit_and_push() {
  if [ -n "$(git status --porcelain)" ]; then
    read -p "Digite a mensagem do commit (ou pressione ENTER para usar padrão): " commit_message
    commit_message=${commit_message:-$COMMIT_MESSAGE_DEFAULT}

    git add .
    git commit -m "$commit_message"
    git push origin "$BRANCH"

    echo -e "${GREEN}Alterações enviadas com sucesso! (Commit: \"$commit_message\")${RESET}"
  else
    echo -e "${YELLOW}Nenhuma alteração detectada para enviar.${RESET}"
  fi
}

# ===== FLUXO PRINCIPAL =====

echo -e "${YELLOW}======================================="
echo "Iniciando processo de atualização Git..."
echo -e "=======================================${RESET}"

install_git

if [ ! -d ".git" ]; then
  initialize_repo
else
  echo -e "${GREEN}Repositório Git já existente.${RESET}"
fi

configure_git
update_remote
commit_and_push

echo -e "${GREEN}======================================="
echo "Processo concluído com sucesso."
echo -e "=======================================${RESET}"