FROM apache/hop:2.13.0

ENV HOP_PROJECT_NAME="Jade-Extrator-Hop"
ENV HOP_PROJECT_FOLDER="/opt/hop/projects/jade-extrator"
ENV HOP_FILE_PATH="${HOP_PROJECT_FOLDER}/metadata/dataset/workflow/Index.hwf"
ENV HOP_PROJECT_CONFIG_FILE_NAME="project-config.json"
ENV HOP_RUN_CONFIG="local"
ENV HOP_LOG_LEVEL="Basic"
ENV HOP_CUSTOM_ENTRYPOINT_EXTENSION_SHELL_FILE_PATH="/home/hop/entrypoint.sh"

USER root

RUN apk add --no-cache gettext postgresql-client

RUN mkdir -p ${HOP_PROJECT_FOLDER}

COPY metadata/ ${HOP_PROJECT_FOLDER}/metadata/
COPY project-config.template.json ${HOP_PROJECT_FOLDER}/project-config.template.json
COPY entrypoint.sh /home/hop/entrypoint.sh

RUN chown -R hop:hop ${HOP_PROJECT_FOLDER} /home/hop/entrypoint.sh
RUN chmod +x /home/hop/entrypoint.sh

USER hop
