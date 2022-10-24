#!/bin/bash
/usr/libexec/softethervpn/vpnserver/vpnserver start
sleep 1
echo "SoftEtherVPN is running, go to https://localhost:5555/admin/"
while true
do
  echo "Running." > /dev/null
  sleep 1
done
