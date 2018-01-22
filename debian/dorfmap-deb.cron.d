# /etc/cron.d/dorfmap-helpers

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root

# m    h   dom mon dow user      command
# events
  58   *   *   *   *   www-data  wget -O /tmp/cccd.ics --quiet 'https://chaosdorf.de/~derf/cccd.ics'

# dorfmap
  *    *   *   *   *   www-data  dorfmap-update-clock
  */6  *   *   *   *   www-data  nice dorfmap-control-lights

# website status
  */6  *   *   *   *   root      nice publish-roomstatus
