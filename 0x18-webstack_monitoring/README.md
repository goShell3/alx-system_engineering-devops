# Webstack Monitoring with Datadog

This project covers setting up Datadog monitoring for our web servers.

## Tasks

### 0. Sign up for Datadog and install datadog-agent
- Signed up for Datadog US account (US1 region)
- Installed datadog-agent on web-01
- Created API and Application keys
- Verified host appears in Datadog as `XX-web-01`

## Verification
To verify the agent is running:
```bash
sudo datadog-agent status


DD_SITE="us5.datadoghq.com" \
DD_APM_INSTRUMENTATION_ENABLED=host \
DD_ENV=dev \
DD_APM_INSTRUMENTATION_LIBRARIES=java:1,python:3,js:5,php:1,dotnet:3 \
bash -c "$(curl -L https://install.datadoghq.com/scripts/install_script_agent7.sh)"


### 2. Create an installation script (optional but good practice)
Create `install_datadog.sh`:

```bash
#!/bin/bash
# Installs Datadog agent on Ubuntu

DD_API_KEY="your_api_key_here" DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"

# Set hostname if needed
sudo hostnamectl set-hostname XX-web-01
sudo service datadog-agent restart
```

# Datadog Monitoring Setup

## Monitors Created
- **Read requests per second**: Monitors `system.io.r_s` on host `XX-web-01`.
- **Write requests per second**: Monitors `system.io.w_s` on host `XX-web-01`.

## Dashboard
- Created a dashboard with at least 4 widgets:
  1. Timeseries: Read requests per second (`system.io.r_s`)
  2. Timeseries: Write requests per second (`system.io.w_s`)
  3. Timeseries: CPU usage (`system.cpu.user`)
  4. Timeseries: Memory usage (`system.mem.used` or `system.mem.pct_usable`)

## Dashboard ID
- See `2-setup_datadog` for the dashboard ID placeholder. Replace with your actual dashboard ID after creation.
