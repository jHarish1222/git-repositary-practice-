#
# Cookbook:: learn_chef_apache2
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Update Package cache

if node['platform'] == "ubuntu" 
	apt_update 'Update apt cache daily' do
		frequency 86_400
		action :periodic
	end

	# Install Package apache 2
	package 'apache2'

	# Start Apache 2 Service
	service 'apache2' do
		supports :status => true
		action [:enable, :start]
	end

        template '/var/www/html/index.html' do
		source 'index.html.erb'
		mode '0644'
		owner 'web_admin'
		group 'web_admin'
	end	

else
	package 'httpd'
	
	service 'httpd' do
		action [:enable, :start]
	end
	


end


