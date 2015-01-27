#
# Cookbook Name:: jenkins
# Attributes:: default

default['jenkins']['dependency-package'] = [
  "wget",
  "java-1.7.0-openjdk",
  "java-1.7.0-openjdk-devel"
]

default['jenkins']['repo_url']  = "http://pkg.jenkins-ci.org/redhat/jenkins.repo"
default['jenkins']['repo_path'] = "/etc/yum.repos.d/jenkins.repo"
default['jenkins']['repo_key']  = "http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key"
default['jenkins']['port']      = "8041"

default['jenkins']['cli-install-dir']  = "/usr/local/jenkins-cli"

default['jenkins']['plugin'] = [
  "http://updates.jenkins-ci.org/download/plugins/seleniumhq/0.4/seleniumhq.hpi",
  "http://updates.jenkins-ci.org/download/plugins/seleniumhtmlreport/0.94/seleniumhtmlreport.hpi"
]