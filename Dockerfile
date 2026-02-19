FROM apache/hop:latest

USER root

COPY . /files/jade-extrator

RUN chown -R hop:hop /files/jade-extrator

USER hop