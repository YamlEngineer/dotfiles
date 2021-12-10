#!/bin/bash
countryCode=$(curl -s http://ip-api.com/json | jq -r '.countryCode')
if [[ -z $countryCode ]]; then
  echo "OFF"
else
  echo $countryCode
fi
