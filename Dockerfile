FROM vcatechnology/arch:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

# Install development packages
RUN vca-install-packages \
  make \
  cmake \
  automake \
  git \
  python \
  sudo

# Grab the VCA CI scripts
RUN vca-install-packages wget && \
  wget https://tool-chain.vcatechnology.com/release/vca-tool-chain-ci-scripts-latest.tar.xz && \
  tar -Jxf vca-tool-chain-ci-scripts-latest.tar.xz -C / && \
  rm vca-tool-chain-ci-scripts-latest.tar.xz && \
  vca-uninstall-packages wget

# Create a build-server user with sudo permissions & no password
RUN useradd -ms /bin/bash build-server && \
    echo "build-server ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/build-server && \
    echo "#includedir /etc/sudoers.d" >> /etc/sudoers && \
    chmod 0440 /etc/sudoers.d/build-server

# Set the build-server user as default
WORKDIR /builds
USER build-server
