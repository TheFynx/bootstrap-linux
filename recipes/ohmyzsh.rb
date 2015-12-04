#
# Cookbook Name:: bootstrap_linux
# Recipe:: ohmyzsh
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

if node[:ohmyzsh][:install]
  execute 'ohmyzsh' do
    command 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
    action :run
    not_if { File.exists?('/bin/zsh') }
  end

  template "#{node[:home]}/.zshrc" do
    source 'zshrc.erb'
    owner node[:user]
    mode 00744
  end
end
