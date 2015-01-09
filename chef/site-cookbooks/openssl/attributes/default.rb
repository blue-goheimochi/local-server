#
# Cookbook Name:: openssl
# Attributes:: default

default['sshd']['port'] = '22';

default['sshd']['match_users'] = [
  'vagrant'
];