FROM ubuntu:16.04

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install required tools
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    vim \
    shellcheck \
    && apt-get clean

# Default work directory
WORKDIR /scripts

# Set default command to ShellCheck all .sh or non-extension bash scripts
CMD find . -type f -executable -exec echo "✔ Checking {}" \; -exec shellcheck {} \; || echo "No executable files found"
