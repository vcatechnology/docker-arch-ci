FROM vcatechnology/arch:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

# install development packages
RUN pacman --noconfirm --needed -S \
  make \
  cmake \
  automake \
  git \
  python \
  sudo \
  && pacman --noconfirm -Scc

# grab the VCA CI scripts
RUN pacman --noconfirm --needed -S wget tar xz && \
  wget https://tool-chain.vcatechnology.com/release/vca-tool-chain-ci-scripts-latest.tar.xz && \
  tar -Jxf vca-tool-chain-ci-scripts-latest.tar.xz -C / && \
  rm vca-tool-chain-ci-scripts-latest.tar.xz && \
  pacman -Rsn --noconfirm wget tar xz && \
  pacman --noconfirm -Scc

# create a build-server user with sudo permissions & no password
RUN useradd -ms /bin/bash build-server && \
    echo "build-server ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/build-server && \
    echo "#includedir /etc/sudoers.d" >> /etc/sudoers && \
    chmod 0440 /etc/sudoers.d/build-server

# set the build-server user as default
WORKDIR /builds
USER build-server
