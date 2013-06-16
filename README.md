# Vagrant LEMP Stack w/ Redis
Default LEMP development VM for testing/hobby development.

## Usage:
 * Download and install Vagrant and VirtualBox from http://vagrantup.com and https://www.virtualbox.org/ respectively. If you are using linux, use the packages appropriate to your distro as sometimes you can get weird bugs with downloading them from their respective sites. [e.g. I had an issue where Vagrant + Virtualbox = Reboot randomly, from packages it was fine.]
 * $ git clone --recursive git@github.com:BlackRobeRising/vagrant-lemp-redis-stack.git lemp && cd lemp && vagrant up

## Where do you put your web app?
 * ./www - This is the directory that is mounted onto /var/www/ in the VM [/var/www/dev.local/htdocs is the full path of the default dev site]
 * ./opt - This is just gets mounted on /opt in case you need additional stuff [e.g. adding an irc bot]

## What is installed:
 * Ubuntu 12.04 LTS - Base VM box, default option for vagrant
 * include_recipe "build-essential"        #https://github.com/opscode-cookbooks/build-essential
 * include_recipe "ohai"                   #https://github.com/opscode-cookbooks/ohai
 * include_recipe "openssl"                #https://github.com/opscode-cookbooks/openssl
 * include_recipe "apt"                    #https://github.com/opscode-cookbooks/apt && cd apt && git checkout 1.7.0
 * include_recipe "git"                    #https://github.com/opscode-cookbooks/git
 * include_recipe "php"                    #https://github.com/opscode-cookbooks/php
 * include_recipe "nginx"                  #https://github.com/opscode-cookbooks/nginx
 * include_recipe "mysql"                  #https://github.com/opscode-cookbooks/mysql
 * include_recipe "mysql::server"
 * include_recipe "php-fpm"                #https://github.com/yevgenko/cookbook-php-fpm php-fpm
 * include_recipe "redis-server"           #https://github.com/teamsnap/redis-server
 * package "php5-mysqlnd"
 * package "php5-pspell"
 * package "php5-enchant"
 * package "php-xml-parser"
 * package "php5-gd"
 * package "php5-geoip"

## Cosmetic:
 * Everything is setup to run off zsh / oh-my-zsh
