FROM apache/hop:2.13.0

# Variáveis que forçam o Hop a executar o workflow e encerrar, em vez de abrir o servidor
ENV HOP_PROJECT_NAME="Jade-Extrator-Hop"
ENV HOP_PROJECT_FOLDER="/opt/hop/projects/jade-extrator"
ENV HOP_FILE_PATH="${HOP_PROJECT_FOLDER}/metadata/dataset/workflow/Index.hwf"
ENV HOP_PROJECT_CONFIG_FILE_NAME="project-config.json"
ENV HOP_RUN_CONFIG="local"
ENV HOP_LOG_LEVEL="Basic"

USER root

# Cria o diretório do projeto
RUN mkdir -p ${HOP_PROJECT_FOLDER}

# Copia apenas o necessário (metadados e configurações)
# Isso evita que você tenha que clonar o projeto toda vez
COPY metadata/ ${HOP_PROJECT_FOLDER}/metadata/
COPY project-config.json ${HOP_PROJECT_FOLDER}/project-config.json

# Garante que a pasta de destino dos XMLs exista internamente
RUN mkdir -p ${HOP_PROJECT_FOLDER}/metadata/dataset/xml

# Ajusta permissões
RUN chown -R hop:hop ${HOP_PROJECT_FOLDER}

USER hop

# O entrypoint original da imagem apache/hop já chamará o hop-run.sh 
# automaticamente porque definimos HOP_FILE_PATH acima.