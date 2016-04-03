# /etc/cron.d/dorfmap-helpers

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root

# m    h   dom mon dow user      command
  59   *   *   *   *   www-data  nice gather_bgdata_door
  */6  *   *   *   *   www-data  nice automatic_light_control
  */6  *   *   *   *   root      nice raumstatus_update
  */4  *   *   *   *   www-data  nice gather_bgdata
  *    *   *   *   *   www-data  update_www_status
  *    *   *   *   *   www-data  update_clocks
