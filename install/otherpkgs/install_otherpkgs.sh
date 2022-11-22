#!/usr/bin/env bash
set -ex

apt-get update
apt install -y \
	keepassxc \
	bloodhound \
	neo4j \
	shutter

