#! /bin/bash
ifconfig en0 | grep ether

ADDR="$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')"

echo $ADDR

sudo ifconfig en0 ether $ADDR

ifconfig en0 | grep ether
