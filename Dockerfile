FROM debian:12.11-slim

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    ca-certificates \
    fontconfig \
    gnupg \
    perl \
    tar \
    wget \
 && rm --recursive --force /var/lib/apt/lists/* \
### Install minimal Tex Live
 && mkdir --parents /tinytex \
 && cd /tinytex \
 && wget "https://yihui.org/gh/tinytex/tools/install-unx.sh" \
 && chmod +x install-unx.sh \
 && ./install-unx.sh

ENV PATH="/root/bin:${PATH}"
