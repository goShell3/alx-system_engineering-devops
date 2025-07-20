#!/bin/bash
# Install Datadog Agent on Ubuntu
# Usage: sudo DD_API_KEY=your_api_key DD_HOSTNAME=XX-web-01 bash install_datadog.sh

DD_API_KEY=${DD_API_KEY:-your_api_key}
DD_HOSTNAME=${DD_HOSTNAME:-XX-web-01}

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"

sed -i "s/^#* *hostname:.*/hostname: $DD_HOSTNAME/" /etc/datadog-agent/datadog.yaml

systemctl restart datadog-agent

echo "Datadog agent installed and configured with hostname $DD_HOSTNAME."