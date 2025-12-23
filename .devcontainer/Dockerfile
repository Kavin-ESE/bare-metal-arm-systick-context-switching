FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    gcc-arm-none-eabi \
    gdb-multiarch \
    qemu-system-arm \
    make \
    binutils-arm-none-eabi \
    python3 \
    python3-pip \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install pygments

RUN wget -O /root/.gdbinit https://git.io/.gdbinit

SHELL ["/bin/bash", "-c"]
