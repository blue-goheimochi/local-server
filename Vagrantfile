VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos65-x86_64-20131205"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"

  # Set the IP address of unused if it would conflict with the IP you are using already
  config.vm.network :private_network, ip: "192.168.33.14"

  # Install chef
  config.vm.provision :shell, :inline => "curl -L 'https://www.getchef.com/chef/install.sh' | sudo bash"

  # provisioning with chef solo.
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./chef/cookbooks","./chef/site-cookbooks"]
    chef.add_recipe "yum"
  end

end