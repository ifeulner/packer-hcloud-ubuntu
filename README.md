# Customized ubuntu image on Hetzner Cloud

Create an Ubuntu 20.04 snapshot on [Hetzner Cloud](https://www.hetzner.com/cloud) that meets the [DevSec Linux Baseline](https://github.com/dev-sec/linux-baseline) specification.

Configuration management is done via ansible using the `os-hardening-role`of the [ansible dev-sec collection](https://github.com/dev-sec/ansible-collection-hardening/tree/master/roles/os_hardening).
Used roles see ansible/requirements.yml

## Install packer

packer is a great tool provided by Hashicorp, for more details see [Packer by Hashicorp](https://www.packer.io)

On macOS using [brew](https://brew.sh)

```bash
brew install packer
```

## Building

```bash
export HCLOUD_TOKEN=<redacted>

# for verbose logging
# export PACKER_LOG=1

packer build hcloud-ubuntu-snapshot.pkr.hcl
```

Afterwards your can connect via `ssh` on port `2222`.

## Managing images

```bash
# show all snapshots (customized images)
hcloud image list -t snapshot

# get all images with label ubuntu-snapshot
hcloud image list -o noheader -o "columns=id" -l ubuntu-snapshot
```
