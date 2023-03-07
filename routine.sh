#!/usr/bin/env sh

ttl="300"
if [ "${TTL}" != "" ]; then
    ttl="${TTL}"
fi

# Current record's data
current_entry=$(curl -u "${NAME_DOT_COM_USERNAME}:${NAME_DOT_COM_TOKEN}" "https://api.name.com/v4/domains/${DOMAIN_NAME}/records" -s | jq -c ".records[] | select( .host == \"${DOMAIN_NAME_HOST}\" )")
record_ip=$(echo ${current_entry}|jq -c '.answer'|sed 's/"//g')
record_id=$(echo ${current_entry}|jq -c '.id'|sed 's/"//g')

# Current public IP
current_ip="$(dig +short txt ch whoami.cloudflare @1.0.0.1|sed 's/"//g')"

if [ "${record_ip}" = "${current_ip}" ]; then
    echo "Address is already updated (${record_ip})"
    exit 0
fi

curl -u "${NAME_DOT_COM_USERNAME}:${NAME_DOT_COM_TOKEN}" \
    -s \
    -X PUT \
    -H 'Content-Type: application/json' \
    --data "{\"host\":\"${DOMAIN_NAME_HOST}\",\"type\":\"A\",\"answer\":\"${current_ip}\",\"ttl\":${ttl}}" \
    "https://api.name.com/v4/domains/${DOMAIN_NAME}/records/${record_id}"