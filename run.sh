#!/bin/bash

: ${IL_HOST=localhost}
: ${IL_PORT=8080}

export IL_HOST
export IL_PORT

/utils/replace-vars /var/www/html/config/default.json

echo "Starting nginx"

nginx
