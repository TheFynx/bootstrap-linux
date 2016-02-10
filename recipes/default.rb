#
# Cookbook Name:: bootstrap_linux
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "bootstrap_linux::ohmyzsh"
include_recipe "bootstrap_linux::config"
include_recipe "bootstrap_linux::packages"

if node['apps']['virtualbox']
  include_recipe "bootstrap_linux::virtualbox"
end

if node['apps']['atom']
  include_recipe "bootstrap_linux::atom"
end
