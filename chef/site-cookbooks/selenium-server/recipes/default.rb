#
# Cookbook Name:: selenium-server
# Recipe:: default
#

node['selenium-server']['dependency-package'].each do |pkg_name|
  package "#{pkg_name}" do
    action :install
    not_if "rpm -q #{pkg_name}"
  end
end

execute "set selenium server" do
  command <<-EOS
    mkdir #{node['selenium-server']['install-dir']}
    cd #{node['selenium-server']['install-dir']}
    wget -O #{node['selenium-server']['jar-name']} #{node['selenium-server']['download-url']}
  EOS
  not_if { File.exist?("#{node['selenium-server']['install-dir']}/#{node['selenium-server']['jar-name']}") }
end