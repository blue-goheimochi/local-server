#
# Cookbook Name:: rpmforge
# Recipe:: default
#

execute "add rpmforge repo" do
  command <<-EOS
    rpm -Uhv #{node['rpmforge']['rpm_url']}
    yum -y update rpmforge-release
  EOS
  not_if "rpm -q rpmforge-release"
end