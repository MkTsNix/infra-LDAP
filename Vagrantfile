# -*- mode: ruby -*-
# vim: set ft=ruby :

MACHINES = {
  :serverldap => {
        :box_name => "centos/7",
        :ip_addr => '192.168.11.120'
  },
  :clientldap => {
        :box_name => "centos/7",
        :ip_addr => '192.168.11.121'
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
            vb.customize ["modifyvm", :id, "--memory", "2048"]
          end

          box.vm.provision "shell", inline: <<-SHELL
            mkdir -p ~root/.ssh; cp ~vagrant/.ssh/auth* ~root/.ssh
            sed -i '65s/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
            systemctl restart sshd
          SHELL

	    #  box.vm.provision "ansible" do |ansible|
            #ansible.verbose = "vv"
            #ansible.playbook = "playbooks/prep_srv.yml"
            #ansible.become = "true"
	    #  end

      end
  end
end
