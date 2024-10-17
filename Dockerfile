FROM debian:12.7-slim

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    ca-certificates \
    fontconfig \
    gnupg \
    perl \
    tar \
    wget \
    # Cleanup
 && apt clean \
 && rm --recursive --force /var/lib/apt/lists/*

RUN mkdir /tinytex \
 && cd /tinytex \
 && wget "https://yihui.org/gh/tinytex/tools/install-unx.sh" \
 && chmod +x install-unx.sh \
 && ./install-unx.sh

ENV PATH="/root/bin:${PATH}"
