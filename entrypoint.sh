#!/bin/sh

echo "=== ENTRYPOINT INICIO ==="
echo "HOP_PROJECT_FOLDER=${HOP_PROJECT_FOLDER}"

TEMPLATE="${HOP_PROJECT_FOLDER}/project-config.template.json"
OUTPUT="${HOP_PROJECT_FOLDER}/project-config.json"

echo "Template path: ${TEMPLATE}"
echo "Output path: ${OUTPUT}"

echo "=== LISTANDO ARQUIVOS DO PROJETO ==="
ls -lah "${HOP_PROJECT_FOLDER}"

echo "=== CONTEUDO DO TEMPLATE ANTES ==="
cat "${TEMPLATE}"

echo "=== EXECUTANDO envsubst ==="
envsubst < "${TEMPLATE}" > "${OUTPUT}"

echo "=== CONTEUDO DO ARQUIVO GERADO ==="
cat "${OUTPUT}"

# sleep 600

echo "=== ENTRYPOINT FIM ==="
