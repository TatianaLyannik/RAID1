# -*- mode: ruby -*-
# vim: set ft=ruby :
home = ENV['HOME']

MACHINES = {
  :otuslinux => {
        :box_name => "centos/7",
        :ip_addr => '192.168.11.101',
        :disks => {
            :sata3 => {
                :dfile => '/home/tatiana/VMs/disks/sata3.vdi',
                :size => 250,
                :port => 3
            },
            :sata4 => {
                :dfile => '/home/tatiana/VMs/disks/sata4.vdi',
                :size => 250,
                :port => 4
            },
            :sata5 => {
                :dfile => '/home/tatiana/VMs/disks/sata5.vdi',
                :size => 250,
                :port => 5
            },
         }
     },
  :otuslinuxi2 => {
        :box_name => "centos/7",
        :ip_addr => '192.168.11.102',
        :disks => {
            :sata3 => {
                :dfile => '/home/tatiana/VMs/disks/sata23.vdi',
                :size => 250,
                :port => 3
            },
            :sata4 => {
                :dfile => '/home/tatiana/VMs/disks/sata24.vdi',
                :size => 250,
                :port => 4
            },
            :sata5 => {
                :dfile => '/home/tatiana/VMs/disks/sata25.vdi',
                :size => 250,
                :port => 5
            },
         }
     }

  }


Vagrant.configure("2") do |config|

  MACHINES.each do |boxname, boxconfig|

      config.vm.define boxname do |box|

          box.vm.box = boxconfig[:box_name]
          box.vm.host_name = boxname.to_s

          #box.vm.network "forwarded_port", guest: 3260, host: 3260+offset

          box.vm.network "private_network", ip: boxconfig[:ip_addr]

          box.vm.provider :virtualbox do |vb|
              vb.customize ["modifyvm", :id, "--memory", "1024"]
        #      vb.customize ["storagectl", :id, "--name", "SATA", "--add", "sata" ]

          boxconfig[:disks].each do |dname, dconf|
                unless File.exist?(dconf[:dfile])
                    vb.customize ['createhd', '--filename', dconf[:dfile], '--variant', 'Fixed', '--size', dconf[:size]]
                end
              vb.customize ['storageattach', :id, '--storagectl', 'SATA', '--port', dconf[:port], '--device', 0, '--type', 'hdd', '--medium', dconf[:dfile]]
          end
        end

          #   box.vm.provision :shell do |s|
          #        s.inline = 'mkdir -p ~root/.ssh; cp ~vagrant/.ssh/auth* ~root/.ssh'
          #end
	     box.vm.provision :shell do |s|
                  s.path = 'raid.sh'
          end


      end
  end
end
