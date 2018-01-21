Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"
  config.vm.network "forwarded_port", guest: 80, host: 80
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
  SHELL
end
