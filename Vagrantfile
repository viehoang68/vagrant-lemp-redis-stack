# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
	config.vm.box = "base"

	config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :hostonly, "10.1.1.2"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
	config.vm.forward_port 80, 8080
	config.vm.forward_port 3306, 3306

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
	config.vm.share_folder "www", "/var/www/", "./www"
	config.vm.share_folder "opt", "/opt", "./opt"

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
	config.vm.provision :chef_solo do |chef|
		chef.cookbooks_path = "./my-recipes/cookbooks"
		chef.roles_path = "./my-recipes/roles"
		chef.data_bags_path = "./my-recipes/data_bags"

		chef.add_recipe("main")
		chef.json.merge!(JSON.parse(File.read("chef-solo.json")))
	end

end
