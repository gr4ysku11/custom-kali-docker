#!/usr/bin/env bash
set -ex

apt-get update
apt install -y seclists curl dnsrecon enum4linux feroxbuster gobuster impacket-scripts nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf

# setup python3 virtualenv
virtualenv -p $(which python3) /pyenv/python3
. /pyenv/python3/bin/activate
pip install impacket
pip install sshuttle

# install autorecon
pip install git+https://github.com/Tib3rius/AutoRecon.git
deactivate

# setup python2 virtualenv
virtualenv -p $(which python2) /pyenv/python2
. /pyenv/python2/bin/activate
pip install impacket
deactivate
