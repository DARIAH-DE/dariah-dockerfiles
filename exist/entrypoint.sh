#!/bin/bash
set -e

# catch missing password
if [ -z "$EXIST_ADMIN_PASSWORD" ]; then
    echo >&2 'error: no password for exist admin account given '
    echo >&2 '  Did you forget to add -e EXIST_ADMIN_PASSWORD=... ?'
    exit 1
fi

# inject memory size
if [ -n "$EXIST_MEMORY" ]; then
    sed -i "s/Xmx%{MAX_MEMORY}m/Xmx${EXIST_MEMORY}m/g" /opt/exist/bin/functions.d/eXist-settings.sh
else
    sed -i "s/Xmx%{MAX_MEMORY}m/Xmx512m/g" /opt/exist/bin/functions.d/eXist-settings.sh
fi

# inject password
/opt/exist/bin/client.sh -l -s -u admin -P \$adminPasswd << EOF 
passwd admin
${EXIST_ADMIN_PASSWORD}
${EXIST_ADMIN_PASSWORD}
quit
EOF

# lets start exist...
/opt/exist/bin/startup.sh
