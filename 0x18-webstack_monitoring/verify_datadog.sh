#!/bin/bash
# Usage: DD_API_KEY=your_api_key DD_APP_KEY=your_app_key DD_HOSTNAME=XX-web-01 bash verify_datadog.sh

DD_API_KEY=${DD_API_KEY:-your_api_key}
DD_APP_KEY=${DD_APP_KEY:-your_app_key}
DD_HOSTNAME=${DD_HOSTNAME:-XX-web-01}

if [ -z "$DD_API_KEY" ] || [ -z "$DD_APP_KEY" ]; then
  echo "Please set DD_API_KEY and DD_APP_KEY environment variables."
  exit 1
fi

response=$(curl -s -X GET "https://api.datadoghq.com/api/v1/hosts" \
  -H "DD-API-KEY: $DD_API_KEY" \
  -H "DD-APPLICATION-KEY: $DD_APP_KEY")

echo "$response" | grep -q "$DD_HOSTNAME"
if [ $? -eq 0 ]; then
  echo "Host $DD_HOSTNAME is visible in Datadog."
else
  echo "Host $DD_HOSTNAME is NOT visible in Datadog."
fi