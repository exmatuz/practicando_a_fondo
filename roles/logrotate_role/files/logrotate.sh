## files/logrotate.sh
#!/bin/sh

/usr/sbin/logrotate /etc/logrotate.conf >/dev/null 2>&1
EXITVALUE=0
if [  != 0 ]; then
    /usr/bin/logger -t logrotate "ALERT exited abnormally with []"
fi
exit 0

