include_recipe "sprout-base::user_owns_usr_local"

template "#{node['sprout']['home']}/.tmux.conf" do
  source "tmux_settings-.tmux.conf.erb"
  owner node['sprout']['user']
  action :create_if_missing
end
