# OpenSSH

Homepage: <https://docs.linuxserver.io/images/docker-openssh-server>

Installs openssh server plus rsync and git as a docker mod installed package.

## Usage

Set `openssh_enabled: true` in your `inventories/<your_inventory>/nas.yml` file.

The exposed ssh port is 2222

## Specific Configuration
These are specified in openssh/defaults/main.yaml and can be changed:

openssh_docker_mods: "linuxserver/mods:universal-package-install"
openssh_install_packages: "rsync git"
openssh_port: "2222"
openssh_data_directory: "{{ docker_home }}/openssh"
openssh_memory: 1g
openssh_container_name: lscr.io/linuxserver/openssh-server:latest
