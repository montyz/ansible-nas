## got from https://iceburn.medium.com/run-ansible-with-docker-9eb27d75285b
## then updated to use pipx
FROM debian:12
RUN apt-get update \
    && apt-get install --no-install-recommends -y pipx \
    && rm -rf /var/lib/apt/lists/*
RUN pipx ensurepath && \
    PIPX_HOME=/opt/pipx PIPX_BIN_DIR=/usr/local/bin PIPX_MAN_DIR=/usr/local/share/man pipx install --include-deps ansible

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sshpass

WORKDIR /work