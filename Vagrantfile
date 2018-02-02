Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
  config.vm.provision "shell", inline: <<-SHELL
     apt-get -y update
     apt-get -y upgrade
     
     # debian package build dependencies
     apt-get -y install git-buildpackage dh-systemd dh-make-perl
     
     # dorfmap-backend runtime dependencies
     apt-get -y install etckeeper htop vim zsh curl \
         nginx libmojolicious-perl libdatetime-perl libfile-slurp-perl \
         libhttp-browserdetect-perl
     apt-file update
     dh-make-perl --build --cpan Astro::Sunrise --version 0.97
     dh-make-perl --build --cpan Mojolicious::Plugin::BrowserDetect --version 0.003
     dpkg -i libastro-sunrise-perl_0.97_all.deb
     dpkg -i libmojolicious-plugin-browserdetect-perl_0.003_all.deb

     # dorfmap debugging (dev environment only)
     ln -s /vagrant/dorfmap-debug /usr/bin/mpv
     ln -s /vagrant/dorfmap-debug /usr/bin/mosquitto_pub
     ln -s /vagrant/dorfmap-debug /usr/bin/si2c-bitwrite
     ln -s /vagrant/dorfmap-debug /usr/bin/si2c-bytewrite
     ln -s /vagrant/dorfmap-debug /usr/bin/si2c-charwrite
     mkdir /var/log/dorfmap
     touch /var/log/dorfmap/mpv
     touch /var/log/dorfmap/mosquitto_pub
     touch /var/log/dorfmap/si2c-bitwrite
     touch /var/log/dorfmap/si2c-bytewrite
     touch /var/log/dorfmap/si2c-charwrite
     chmod 777 /var/log/dorfmap/mpv
     chmod 777 /var/log/dorfmap/mosquitto_pub
     chmod 777 /var/log/dorfmap/si2c-bitwrite
     chmod 777 /var/log/dorfmap/si2c-bytewrite
     chmod 777 /var/log/dorfmap/si2c-charwrite

     # dorfmap-web (installed separately)
     mkdir /root/dorfmap
     mkdir /root/dorfmap/public
     echo "[here be web-frontend]" > /root/dorfmap/public/index.html
     echo "[here be web-frontend]" > /root/dorfmap/public/index.js

     # dorfmap config and audio files not provided by debian package
     mkdir /etc/dorfmap
     echo "bell" > /etc/dorfmap/pw.bell
     echo "powerswitch" > /etc/dorfmap/pw.powerswitch
     echo "avrshift" > /etc/dorfmap/pw.avrshift
     echo "blinkencontrol" > /etc/dorfmap/pw.blinkencontrol
     # /usr/local/share/boot.m4a
     # /usr/local/share/private.wav
     # /usr/local/share/private2.wav
     # /usr/local/share/public.wav
     # /usr/local/share/public.wav
     # /usr/local/share/doorbell1.wav 
     # /usr/local/share/doorbell2.m4a 
     # /usr/local/share/doorbell3.ogg 
     # /usr/local/share/doorbell4.mp3 
     # /usr/local/share/doorbell5.m4a 
     # /usr/local/share/doorbell6.wav 
     # /usr/local/share/doorbell7.ogg 
     # /usr/local/share/doorbell8.ogg 

     # dorfmap state and monitoring state read by dorfmap
     mkdir /srv/www
     mkdir /srv/www/bgdata
     mkdir /srv/www/flukso
     echo "0" > /srv/www/is_shutdown
     echo "0" > /srv/www/bgdata/hosts_dynamic
     echo "0" > /srv/www/bgdata/hosts_total
     echo "0" > /srv/www/bgdata/fb1_tx_bytes
     echo "0" > /srv/www/flukso/30
     echo "0" > /srv/www/flukso/30_p1
     echo "0" > /srv/www/flukso/30_p2
     echo "0" > /srv/www/flukso/30_p3
     chown -R www-data:www-data /srv/www
  SHELL
end
