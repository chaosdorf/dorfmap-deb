# /etc/cron.d/dorfmap-helpers

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root

# m    h   dom mon dow user      command
  */6  *   *   *   *   root      nice automatic_light_control
  */4  *   *   *   *   www-data  nice gather_bgdata
  *    *   *   *   *   www-data  update_www_status
  *    *   *   *   *   www-data  update_clocks
  *    *   *   *   *   root      dorfmap_sanity_check
