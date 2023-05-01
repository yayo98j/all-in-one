#!/bin/bash

while ! nc -z "$NC_DOMAIN" 443; do
    sleep 5
done
sleep 10

if [ -n "$NEXTCLOUD_EXEC_COMMANDS" ]; then
    echo "#!/bin/bash" > /tmp/nextcloud-exec-commands
    echo "$NEXTCLOUD_EXEC_COMMANDS" >> /tmp/nextcloud-exec-commands
    if ! grep "one-click-instance" /tmp/nextcloud-exec-commands; then
        bash /tmp/nextcloud-exec-commands
        rm /tmp/nextcloud-exec-commands
    fi
fi

sleep inf
