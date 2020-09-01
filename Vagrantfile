# -*- mode: ruby -*-
# vi: set ft=ruby :

vms = {
  "controller-0" => { :ip => "192.168.1.10", :mem => 768, :entrypoint => "controller-entrypoint.sh" },
  "controller-1" => { :ip => "192.168.1.11", :mem => 768, :entrypoint => "controller-entrypoint.sh" },
  "controller-2" => { :ip => "192.168.1.12", :mem => 768, :entrypoint => "controller-entrypoint.sh" },
  "lb"           => { :ip => "192.168.1.9",  :mem => 384, :entrypoint => "lb-entrypoint.sh" },
  "worker-0"     => { :ip => "192.168.1.30", :mem => 768, :entrypoint => "worker-entrypoint.sh" },
  "worker-1"     => { :ip => "192.168.1.31", :mem => 768, :entrypoint => "worker-entrypoint.sh" },
}

Vagrant.configure("2") do |config|

  vms.each_with_index do |(hostname, info), index|
    config.vm.define hostname do |cfg|
      cfg.vm.box = "kubernetes"
      cfg.vm.network "private_network", ip: "#{info[:ip]}"
      cfg.vm.synced_folder ".", "/data"
      cfg.vm.hostname = hostname

      cfg.vm.provision "shell", path: "#{info[:entrypoint]}"

      cfg.vm.provider "virtualbox" do |v|
        v.memory = info[:mem]
      end
    end
  end
end
