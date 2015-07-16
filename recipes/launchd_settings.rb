include_recipe "sprout-base::user_owns_usr_local"

template "#{node['sprout']['home']}/Library/LaunchAgents/com.mycron.hourly.plist" do
  source "launchd_com.mycron.hourly.plist.erb"
  owner node['sprout']['user']
  action :create_if_missing
end

execute 'launchctl hourly file'
  command "launchctl load #{node['sprout']['home']}/Library/LaunchAgents/com.mycron.hourly.plist"
end

template "#{node['sprout']['home']}/Library/LaunchAgents/com.mycron.daily.plist" do
  source "launchd_com.mycron.daily.plist.erb"
  owner node['sprout']['user']
  action :create_if_missing
end

execute 'launchctl daily file'
  command "launchctl load #{node['sprout']['home']}/Library/LaunchAgents/com.mycron.daily.plist"
end
