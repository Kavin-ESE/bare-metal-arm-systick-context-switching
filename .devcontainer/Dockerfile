FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install ARM toolchain + QEMU + GDB
RUN apt-get update && apt-get install -y \
    gcc-arm-none-eabi \
    gdb-multiarch \
    qemu-system-arm \
    make \
    cmake \
    ninja-build \
    binutils-arm-none-eabi \
    python3 \
    python3-pip \
    wget \
    curl \
    git \
    vim \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Install pygments (for colored objdump, gdb helpers)
RUN pip3 install pygments --break-system-packages

# Download a good default .gdbinit (for nice register layout)
RUN wget -O /root/.gdbinit https://git.io/.gdbinit

# Set default shell
SHELL ["/bin/bash", "-c"]