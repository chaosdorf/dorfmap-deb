# /etc/cron.d/dorfmap-helpers

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root

# m    h   dom mon dow user      command
  */6  *   *   *   *   root      automatic_light_control
  *    *   *   *   *   www-data  update_www_status
  *    *   *   *   *   www-data  update_clock_cron
