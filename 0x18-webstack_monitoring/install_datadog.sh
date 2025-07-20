
DD_SITE="us5.datadoghq.com" \
DD_APM_INSTRUMENTATION_ENABLED=host \
DD_ENV=dev \
DD_APM_INSTRUMENTATION_LIBRARIES=java:1,python:3,js:5,php:1,dotnet:3 \
bash -c "$(curl -L https://install.datadoghq.com/scripts/install_script_agent7.sh)"