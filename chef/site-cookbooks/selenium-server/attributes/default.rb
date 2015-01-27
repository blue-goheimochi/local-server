#
# Cookbook Name:: selenium-server
# Attributes:: default

default['selenium-server']['dependency-package'] = [
  "wget",
  "java-1.7.0-openjdk",
  "java-1.7.0-openjdk-devel"
]

default['selenium-server']['download-url'] = "http://selenium-release.storage.googleapis.com/2.44/selenium-server-standalone-2.44.0.jar"
default['selenium-server']['jar-name']     = "selenium-server-standalone.jar"
default['selenium-server']['install-dir']  = "/usr/local/selenium-server"