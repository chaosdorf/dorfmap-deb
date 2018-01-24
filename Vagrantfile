Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
  config.vm.provision "shell", inline: <<-SHELL
     apt-get -y update
     apt-get -y upgrade
     
     apt-get -y install git-buildpackage dh-systemd
     
     # dorfmap-deb dependencies
     apt-get -y install etckeeper htop vim zsh

     # dorfmap dependencies
     apt-get -y install nginx

     # dorfmap debugging
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
  SHELL
end
