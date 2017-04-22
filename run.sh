#!/bin/bash

: ${IL_HOST=localhost}
: ${IL_PORT=8080}
: ${IL_TRUSTCHAIN=""}
: ${IL_CONSOLE_CERT=/etc/nginx/certs/sedish.net.crt}
: ${IL_CONSOLE_KEY=/etc/nginx/certs/sedish.net.key}
: ${ILR_HOST=localhost}

export IL_HOST
export IL_PORT
export IL_CONSOLE_CERT
export IL_CONSOLE_KEY
export IL_TRUSTCHAIN
export ILR_HOST

/utils/replace-vars /var/www/html/config/default.json
/utils/replace-vars /etc/nginx/sites-available/default

echo "Starting nginx"

nginx
