#
# Cookbook Name:: wget
# Recipe:: default
#

package "wget" do
  action :install
  not_if "rpm -q wget"
end