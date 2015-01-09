#
# Cookbook Name:: openssl
# Recipe:: default
#

service "sshd" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

template "/etc/ssh/sshd_config" do
  source "sshd_config.erb"
  owner "root"
  group "root"
  mode "0600"
  variables({
    :port        => node['sshd']['port'],
    :match_users => node['sshd']['match_users']
  })
  notifies :restart, "service[sshd]"
end