# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  # General setup
  config.vm.box = "ubuntu/focal64"
  config.vm.box_check_update = false
  config.vm.hostname = "docker-lab"

  # Network
  config.vm.network "public_network", auto_config: true
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  
  # Provision
  config.vm.provision "file", source: "./Dockerfile", destination: "/tmp/Dockerfile"
  config.vm.provision "file", source: "./docker-compose.yaml", destination: "/tmp/docker-compose.yaml"
  config.vm.provision "file", source: "./.env", destination: "/tmp/.env"
  config.vm.provision "file", source: "./package.json", destination: "/tmp/package.json"
  config.vm.provision "shell", path: "setup.sh" 
end
