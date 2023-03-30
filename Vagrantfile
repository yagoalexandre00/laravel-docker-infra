# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "docker-lab"
  config.vm.network "public_network"
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  # config.vm.synced_folder ".", "/vagrant", type: "nfs"
  config.vm.provision "shell", path: "setup.sh" 
end
