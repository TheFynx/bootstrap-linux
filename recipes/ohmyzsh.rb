#
# Cookbook Name:: bootstrap_linux
# Recipe:: ohmyzsh
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

if node[:ohmyzsh][:install]
  package 'zsh'

  execute 'ohmyzsh' do
    command 'curl -S https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh'
    cwd node['home']
    user node['user']
    action :run
    only_if { File.exists?('/bin/zsh') }
  end

  template "#{node['home']}/.zshrc" do
    source 'zshrc.erb'
    user node['user']
    owner node['user']
    mode 00744
  end
end
