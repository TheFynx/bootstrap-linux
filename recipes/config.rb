#
# Cookbook Name:: bootstrap_linux
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

if node[:config][:github]
  %w{public private gists}.each do |dir|
    directory "#{node[:home]}/git/github/#{dir}" do
      owner node[:user]
      mode 00755
      recursive true
      action :create
    end
  end
end

if node[:config][:gitbucket]
  %w{public private gists}.each do |dir|
    directory "#{node[:home]}/git/gitbucket/#{dir}" do
      owner node[:user]
      mode 00755
      recursive true
      action :create
    end
  end
end
