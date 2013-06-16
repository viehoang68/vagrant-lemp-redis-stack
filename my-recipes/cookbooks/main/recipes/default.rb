# Designed for Ubuntu 12.04 LTS

group "www" do
  action :create
end

user "www" do
  gid "www"
  home "/var/www"
  system true
  shell "/bin/false"
end


include_recipe "build-essential"	#https://github.com/opscode-cookbooks/build-essential
include_recipe "ohai"			#https://github.com/opscode-cookbooks/ohai
include_recipe "openssl" 		#https://github.com/opscode-cookbooks/openssl
include_recipe "apt"			#https://github.com/opscode-cookbooks/apt && cd apt && git checkout 1.7.0
include_recipe "git"			#https://github.com/opscode-cookbooks/git
include_recipe "php"			#https://github.com/opscode-cookbooks/php
include_recipe "nginx"			#https://github.com/opscode-cookbooks/nginx
include_recipe "mysql"			#https://github.com/opscode-cookbooks/mysql
include_recipe "mysql::server"
include_recipe "php-fpm"		#https://github.com/yevgenko/cookbook-php-fpm php-fpm
include_recipe "redis-server"		#https://github.com/teamsnap/redis-server

# setup the configuration files
# be sure to read: http://wiki.nginx.org/Pitfalls
# this is the www directory in the vagrant root folder
cookbook_file "/etc/nginx/sites-available/dev.local" do
	source "nginx/dev.local"
	mode 0640
	owner "root"
	group "root"
end

execute "ln -s /etc/nginx/sites-available/dev.local /etc/nginx/sites-enabled/dev.local" #symlink as per the debian standard methodology

# load new php modules
package "php5-fpm"
package "php5-mysqlnd"
package "php5-pspell"
package "php5-enchant"
package "php-xml-parser"
package "php5-gd"
package "php5-geoip"

# update
execute "apt-get update"

#restart services to confirm everything was reloaded
execute "service nginx restart"
execute "service php5-fpm restart"
execute "service mysql restart"


# install customizations
package "vim"
package "nmap"
package "zsh"

# install as root
execute "git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"
execute "cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc"
execute "chsh -s /bin/zsh"

# install as vagrant
execute "git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh"
execute "cp ~/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc"
execute "chsh -s /bin/zsh vagrant"
