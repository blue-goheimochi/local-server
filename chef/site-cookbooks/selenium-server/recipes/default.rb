#
# Cookbook Name:: selenium-server
# Recipe:: default
#

include_recipe "wget"
include_recipe "java-openjdk"
include_recipe "java-openjdk-devel"

execute "set selenium server" do
  command <<-EOS
    mkdir #{node['selenium-server']['install-dir']}
    cd #{node['selenium-server']['install-dir']}
    wget -O #{node['selenium-server']['jar-name']} #{node['selenium-server']['download-url']}
  EOS
  not_if { File.exist?("#{node['selenium-server']['install-dir']}/#{node['selenium-server']['jar-name']}") }
end