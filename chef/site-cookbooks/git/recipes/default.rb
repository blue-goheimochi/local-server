#
# Cookbook Name:: git
# Recipe:: default
#

execute "git config --global user.name" do
  user  "vagrant"
  group "vagrant"
  cwd   "/home/vagrant"
  command <<-EOS
    export HOME=/home/vagrant
    git config --global user.name "#{node['user']['name']}"
  EOS
  not_if "git config --global user.name | grep -w '#{node['user']['name']}'"
end

execute "git config --global user.email" do
  user  "vagrant"
  group "vagrant"
  cwd   "/home/vagrant"
  command <<-EOS
    export HOME=/home/vagrant
    git config --global user.email '#{node['user']['email']}'
  EOS
  not_if "git config --global user.email | grep -w '#{node['user']['email']}'"
end

execute "git config --global color.diff" do
  user  "vagrant"
  group "vagrant"
  cwd   "/home/vagrant"
  command <<-EOS
    export HOME=/home/vagrant
    git config --global color.diff auto
  EOS
  not_if "git config --global color.diff | grep -w 'auto'"
end

execute "git config --global color.status" do
  user  "vagrant"
  group "vagrant"
  cwd   "/home/vagrant"
  command <<-EOS
    export HOME=/home/vagrant
    git config --global color.status auto
  EOS
  not_if "git config --global color.status | grep -w 'auto'"
end

execute "git config --global color.branch" do
  user  "vagrant"
  group "vagrant"
  cwd   "/home/vagrant"
  command <<-EOS
    export HOME=/home/vagrant
    git config --global color.branch auto
  EOS
  not_if "git config --global color.branch | grep -w 'auto'"
end