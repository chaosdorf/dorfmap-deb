# /etc/cron.d/dorfmap-helpers

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root

# m    h   dom mon dow user      command
  59   *   *   *   *   www-data  nice gather_bgdata_door
  58   *   *   *   *   www-data  wget -O /tmp/cccd.ics --quiet 'https://chaosdorf.de/~derf/cccd.ics'
  */6  *   *   *   *   www-data  nice automatic_light_control
  */6  *   *   *   *   root      nice raumstatus_update
  */4  *   *   *   *   www-data  nice gather_bgdata
  */4  *   *   *   *   www-data  nice gather_bgdata_tmp
  *    *   *   *   *   www-data  update_www_status
  *    *   *   *   *   www-data  update_clocks
  *    *   *   *   *   www-data  update_prometheus
