# -*- mode: ruby -*-
# vi: set ft=ruby :

controllers = {
  "controller-0" => { :ip => "192.168.1.10" },
  "controller-1" => { :ip => "192.168.1.11" },
  "controller-2" => { :ip => "192.168.1.12" },
}

Vagrant.configure("2") do |config|

  config.vm.define "lb" do |lb|
    lb.vm.box = "kubernetes"
    lb.vm.network "private_network", ip: "192.168.1.9"
    lb.vm.synced_folder ".", "/data"
    lb.vm.hostname = "lb"
  end

  controllers.each_with_index do |(hostname, info), index|
    config.vm.define hostname do |cfg|
      cfg.vm.box = "kubernetes"
      cfg.vm.network "private_network", ip: "#{info[:ip]}"
      cfg.vm.synced_folder ".", "/data"
      cfg.vm.hostname = hostname
    end
  end

end
