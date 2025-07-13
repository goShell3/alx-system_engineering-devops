# SSL Termination and HTTP Redirection

## Description
This project configures HAProxy for SSL termination and HTTP to HTTPS redirection.

## Files
- `0-world_wide_web`: Bash script to check DNS records
- `1-haproxy_ssl_termination`: HAProxy SSL termination configuration
- `100-redirect_http_to_https`: HAProxy HTTP to HTTPS redirection configuration

## Requirements
- Ubuntu 16.04 LTS
- HAProxy 1.5+
- Certbot for SSL certificates

## Installation
```bash
chmod +x 0-world_wide_web
sudo apt install haproxy certbot