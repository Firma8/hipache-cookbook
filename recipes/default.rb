#
# Cookbook Name:: hipache
# Recipe:: default
#

include_recipe('nodejs')

execute 'install hipache' do
  user 'root'
  command "npm install hipache#{'@'+node['hipache']['version'] if node['hipache']['version']} -g"
  not_if 'which hipache'
end

template node['hipache']['config_path'] do
  source 'hipache.json.erb'
  owner 'root'
  group 'root'
  mode 0644
  action :create
  variables :hipache => node['hipache']
  notifies :restart, 'service[hipache]'
end

template '/etc/init/hipache.conf' do
  source 'upstart.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  variables :config_path => node['hipache']['config_path']
  action :create
end

service 'hipache' do
  action :nothing
  supports :restart => true
  provider Chef::Provider::Service::Upstart
end
