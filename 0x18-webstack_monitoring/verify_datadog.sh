#!/bin/bash
# Verifies Datadog installation

echo "Agent status:"
sudo datadog-agent status

echo -e "\nHost metrics:"
curl -X GET "https://api.datadoghq.com/api/v1/hosts/XX-web-01" \
-H "Content-Type: application/json" \
-H "DD-API-KEY: $1" \
-H "DD-APPLICATION-KEY: $2"