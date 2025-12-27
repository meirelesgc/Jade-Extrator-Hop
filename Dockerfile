FROM apache/hop:2.13.0

ENV HOP_PROJECT_NAME="Jade-Extrator-Hop"
ENV HOP_PROJECT_FOLDER="/opt/hop/projects/jade-extrator"
ENV HOP_FILE_PATH="${HOP_PROJECT_FOLDER}/metadata/dataset/workflow/Index.hwf"
ENV HOP_PROJECT_CONFIG_FILE_NAME="project-config.json"
ENV HOP_RUN_CONFIG="local"
ENV HOP_LOG_LEVEL="Basic"

USER root

RUN mkdir -p ${HOP_PROJECT_FOLDER}

COPY metadata/ ${HOP_PROJECT_FOLDER}/metadata/
COPY project-config.json ${HOP_PROJECT_FOLDER}/project-config.json

RUN mkdir -p ${HOP_PROJECT_FOLDER}/metadata/dataset/xml

RUN chown -R hop:hop ${HOP_PROJECT_FOLDER}

USER hop