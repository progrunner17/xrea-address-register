#!/bin/sh

set -e

address=$(curl -s ifconfig.me)
resp=$(curl -sS -X POST \
  -d "account=${INPUT_XREA_ACCOUNT}" \
  -d "server_name=${INPUT_XREA_SERVER}" \
  -d "api_secret_key=${INPUT_XREA_API_KEY}" \
  -d "param[addr]=${address}" \
  https://api.xrea.com/v1/tool/ssh_ip_allow)

echo ${resp}
echo ${resp} |grep '"status_code":200' > /dev/null 2> /dev/null
