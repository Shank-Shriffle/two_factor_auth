require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require "./app"
  end
end

task :configure_routes do
  require "sinatra-rake-routes"
  require './app'
  SinatraRakeRoutes.set_app_class(TwoFactorAuth)
end

require "sinatra-rake-routes/tasks"