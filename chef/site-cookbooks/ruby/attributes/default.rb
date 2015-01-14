#
# Cookbook Name:: ruby
# Attributes:: default

default['rbenv']['url'] = "https://github.com/sstephenson/rbenv.git"
default['rbenv']['install-dir'] = "/usr/local/rbenv"
default['rbenv']['shell-path'] = "/etc/profile.d/rbenv.sh"
default['rbenv']['plugin-dir'] = "/usr/local/rbenv/plugins"
default['ruby-build']['url'] = "https://github.com/sstephenson/ruby-build.git"
default['ruby-build']['install-dir'] = "/usr/local/rbenv/plugins/ruby-build"
default['ruby']['ver'] = "2.2.0"