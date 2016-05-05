FROM vcatechnology/arch:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

RUN pacman --noconfirm --needed -S \
  make \
  cmake \
  automake \
  git \
  python \
  sudo
