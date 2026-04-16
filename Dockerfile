FROM apache/hop:latest

USER root

COPY --chown=hop:hop . /files/jade-extrator

RUN chmod -R u+rwX /files/jade-extrator

USER hop