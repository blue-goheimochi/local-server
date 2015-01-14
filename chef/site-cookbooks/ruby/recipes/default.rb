#
# Cookbook Name:: ruby
# Recipe:: default
#

%w(gcc openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel).each do |pkg_name|
  package "#{pkg_name}" do
    action :install
    not_if "rpm -q #{pkg_name}"
  end
end

execute "rbenv install" do
  command <<-EOS
    git clone #{node['rbenv']['url']} #{node['rbenv']['install-dir']}
  EOS
  not_if { File.exist?("#{node['rbenv']['install-dir']}") }
end

execute "ruby-build install" do
  command <<-EOS
    git clone #{node['ruby-build']['url']} #{node['ruby-build']['install-dir']}
  EOS
  not_if { File.exist?("#{node['ruby-build']['install-dir']}") }
end

execute "mkdir #{node['rbenv']['install-dir']}/shims" do
  command <<-EOS
    mkdir #{node['rbenv']['install-dir']}/shims
  EOS
  not_if { File.exist?("#{node['rbenv']['install-dir']}/shims") }
end

execute "mkdir #{node['rbenv']['install-dir']}/versions" do
  command <<-EOS
    mkdir #{node['rbenv']['install-dir']}/versions
  EOS
  not_if { File.exist?("#{node['rbenv']['install-dir']}/versions") }
end

execute "init rbenv" do
  command <<-EOS
    #{node['rbenv']['install-dir']}/bin/rbenv init -
  EOS
end

template "/etc/profile.d/rbenv.sh" do
  source "rbenv.sh.erb"
  owner "root"
  group "root"
  mode "0644"
  variables({
    :rbenv_root => node['rbenv']['install-dir']
  })
end

execute "ruby install" do
  command <<-EOS
    source /etc/profile.d/rbenv.sh
    rbenv install #{node['ruby']['ver']}
    rbenv global #{node['ruby']['ver']}
    rbenv rehash
  EOS
  not_if { File.exist?("#{node['rbenv']['install-dir']}/versions/#{node['ruby']['ver']}") }
end