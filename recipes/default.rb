gem_package "koseki-mocksmtpd" do
  source "http://gems.github.com"
end

directory "/var/tmp/mocksmtpd" do
  owner "root"
  group "root"
  mode 00755
  action :create
end

config_path = '/etc/mocksmtpd'
daemon_args = "--config=#{config_path}/mocksmtpd.conf"

directory "#{config_path}" do
  owner "root"
  group "root"
  mode 00755
  action :create
end

template "#{config_path}/mocksmtpd.conf" do
  source "mocksmtpd.conf.erb"
end

template "/etc/init.d/mocksmtpd" do
  source "service.erb"
  owner "root"
  group "root"
  mode 00755
end

service "mocksmtpd" do
  #start_command "mocksmtpd #{daemon_args} start"
  #stop_command "mocksmtpd stop"
  action [:enable, :start]
end
