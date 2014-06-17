#
# Cookbook Name:: hipache
# Attributes:: default
#

default['hipache']['version'] = nil # will install latest version unless specified
default['hipache']['config_path'] = '/etc/hipache.json'
default['hipache']['log_path'] = '/var/log/hipache.log'

default['hipache']['workers'] = 5
default['hipache']['max_sockets'] = 100
default['hipache']['dead_backend_ttl'] = 30

default['hipache']['ssl_enabled'] = false
default['hipache']['ssl_certificate_crt'] = nil
default['hipache']['ssl_certificate_key'] = nil

default['hipache']['driver'] = 'redis://127.0.0.1:6379'


