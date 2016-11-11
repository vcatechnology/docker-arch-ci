# Arch Linux Docker CI Image

[![](https://images.microbadger.com/badges/image/vcatechnology/arch-ci.svg)](http://microbadger.com/images/vcatechnology/arch-ci "Get your own image badge on microbadger.com") 
[![](https://images.microbadger.com/badges/version/vcatechnology/arch-ci.svg)](http://microbadger.com/images/vcatechnology/arch-ci "Get your own version badge on microbadger.com")

This container derives from
[vcatechnology/arch](https://hub.docker.com/r/vcatechnology/arch) so that the
image has the latest [Arch Linux](https://www.archlinux.org/) packages. It then
installs the some useful development packages.

Available on Docker Hub as [vcatechnology/arch-ci](https://hub.docker.com/r/vcatechnology/arch-ci/)

## `sudo`

The Docker image creates a user account 'build-server' with `sudo` permissions. The `sudo` password
is disabled to allow non-interactive sudo calls.
