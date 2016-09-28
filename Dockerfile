FROM vcatechnology/arch:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

# create a buildslave user with sudo permissions & no password
RUN useradd -ms /bin/bash buildslave && \
    mkdir /etc/sudoers.d && \
    echo "buildslave ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/buildslave && \
    echo "#includedir /etc/sudoers.d" >> /etc/sudoers && \
    chmod 755 /etc/sudoers.d && \
    chmod 0440 /etc/sudoers.d/buildslave

RUN pacman --noconfirm --needed -S \
  make \
  cmake \
  automake \
  git \
  python \
  sudo

RUN mkdir /builds && chmod 777 /builds && chown buildslave:buildslave /builds

# set the buildslave user as default
USER buildslave
