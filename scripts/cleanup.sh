#!/bin/bash -eux

# Uninstall Ansible and remove PPA.
apt -y remove --purge ansible
apt-add-repository --remove ppa:ansible/ansible

# Apt cleanup.
apt -y autoremove
apt-get -y update

# Remove all logs in /var/lib
rm -rf /var/log/*
