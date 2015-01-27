#
# Cookbook Name:: jenkins
# Recipe:: default
#

node['jenkins']['dependency-package'].each do |pkg_name|
  package "#{pkg_name}" do
    action :install
    not_if "rpm -q #{pkg_name}"
  end
end

execute "set jenkins repository" do
  command <<-EOS
    wget -O #{node['jenkins']['repo_path']} #{node['jenkins']['repo_url']}
    rpm --import #{node['jenkins']['repo_key']}
  EOS
  not_if { File.exist?("#{node['jenkins']['repo_path']}") }
end

package "jenkins" do
  action :install
  not_if "rpm -q jenkins"
end

service "jenkins" do
 supports :status => true, :restart => true
 action [:enable, :start]
end

template "/etc/sysconfig/jenkins" do
  source "jenkins.erb"
  owner "root"
  group "root"
  mode "0600"
  variables({
    :port => node['jenkins']['port']
  })
  notifies :restart, "service[jenkins]", :immediately
end

execute "set jenkins-cli" do
  command <<-EOS
    mkdir #{node['jenkins']['cli-install-dir']}
    cd #{node['jenkins']['cli-install-dir']}
    wget http://localhost:#{node['jenkins']['port']}/jnlpJars/jenkins-cli.jar
  EOS
  retries 5
  retry_delay 20
  not_if { File.exist?("#{node['jenkins']['cli-install-dir']}/jenkins-cli.jar") }
end

node['jenkins']['plugin'].each do |plugin_id|
  execute "install jenkins plugin ( #{plugin_id} )" do
    command <<-EOS
      java -jar #{node['jenkins']['cli-install-dir']}/jenkins-cli.jar -s http://localhost:#{node['jenkins']['port']} install-plugin #{plugin_id}
    EOS
    not_if "java -jar #{node['jenkins']['cli-install-dir']}/jenkins-cli.jar -s http://localhost:#{node['jenkins']['port']} list-plugin | sed -n -e '/Installed Groups/,$p' | sed -n -e '/Available Groups/,$!p' | grep -w 'Base'"
    notifies :restart, "service[jenkins]"
  end
end