#!/bin/sh
echo "=== PROCESSANDO URLS DE BANCO DE DADOS ==="

# Função para fatiar URL: postgresql://user:password@host:port/database
parse_url() {
  local url=$1
  local prefix=$2 # Ex: DB ou ADMIN_DB
  
  # Extração usando sed (suporta o formato com ou sem porta)
  export ${prefix}_USER=$(echo $url | sed -E 's|.*://([^:]+):.*|\1|')
  export ${prefix}_PASSWORD=$(echo $url | sed -E 's|.*:[^:]+:([^@]+)@.*|\1|')
  export ${prefix}_HOST=$(echo $url | sed -E 's|.*@([^:/]+).*|\1|')
  export ${prefix}_PORT=$(echo $url | sed -E 's|.*:([0-9]+)/.*|\1|')
  export ${prefix}_NAME=$(echo $url | sed -E 's|.*[0-9]+/(.*)|\1|')
}

if [ -n "$DATABASE_URL" ]; then
  parse_url "$DATABASE_URL" "DB"
fi

if [ -n "$ADMIN_DATABASE_URL" ]; then
  parse_url "$ADMIN_DATABASE_URL" "ADMIN_DB"
fi

echo "=== EXECUTANDO envsubst ==="
TEMPLATE="${HOP_PROJECT_FOLDER}/project-config.template.json"
OUTPUT="${HOP_PROJECT_FOLDER}/project-config.json"

# Agora o envsubst terá acesso às variáveis fatiadas (ex: DB_HOST, DB_USER, etc)
envsubst < "${TEMPLATE}" > "${OUTPUT}"

echo "=== ENTRYPOINT FIM ==="