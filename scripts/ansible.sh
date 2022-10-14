#!/bin/bash -eux

# Install Ansible repository.
apt-get -y update && apt-get -y upgrade
apt-get -y install software-properties-common python3-pip

# install via pip
#pip3 install setuptools
#pip3 install wheel
#pip3 install ansible

# Install via apt
apt-add-repository ppa:ansible/ansible
# Install Ansible.
apt-get -y update
apt-get -y install ansible
