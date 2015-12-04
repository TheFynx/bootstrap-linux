#
# Cookbook Name:: bootstrap_linux
# Recipe:: packages
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

if node[:atom][:install]
  case node[:platform]
  when 'fedora'
      execute 'atom_install' do
        command = "dnf install -y https://atom-installer.github.com/v#{node['atom']['version']}/atom.x86_64.rpm"
        not_if 'rpm -qa | grep atom-'
      end
  when 'ubuntu', 'debian', 'linuxmint'
      execute 'atom_install' do
        command = "dnf install -y https://atom-installer.github.com/v#{node['atom']['version']}/atom.x86_64.rpm"
      end

    end
end

if node[:atom][:star_package_install]
  execute 'apm star install' do
    command "apm stars --user #{node[:atom][:username]}"
    action :run
  end
end

if node[:atom][:install_package_list]
  template '/tmp/packagelist.txt' do
    source 'packagelist.txt.erb'
    owner node[:user]
    mode 00774
  end
  execute 'apm package install' do
    command "apm install --packages-file /tmp/packagelist.txt"
    action :run
  end
end
