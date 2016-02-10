#
# Cookbook Name:: bootstrap_linux
# Recipe:: packages
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Brew Installs
if node[:apps][:git]
  package 'git'
end

# Cask Installs
if node[:apps][:googlechrome]
  package 'google-chrome'
end

if node[:apps][:vagrant]
  package 'vagrant'
end

if node['apps']['dockertoolbox']
  package 'docker'
end

if node['apps']['chefdk']
  package 'chefdk'
end

if node['apps']['terminator']
  package 'terminator'
end
