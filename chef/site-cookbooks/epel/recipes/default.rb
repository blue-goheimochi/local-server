#
# Cookbook Name:: epel
# Recipe:: default
#

execute "add epel repo" do
  command <<-EOS
    rpm -Uhv #{node['epel']['rpm_url']}
    yum -y update epel-release
  EOS
  not_if "rpm -q epel-release"
end