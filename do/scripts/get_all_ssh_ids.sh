#!/bin/bash

# This script exports all SSH Keys from a digital ocean account
# needs Python!
# Parameter: API_KEY

API_KEY=$1

curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer ${API_KEY}" "https://api.digitalocean.com/v2/account/keys" | sed -e 's/[{}]/''/g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}'
