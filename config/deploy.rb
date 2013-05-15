# require "bundler/capistrano"
require 'puma/capistrano'

task :staging do
  set :rails_env, "production"
  set :location, "staging.solargeometryapi.tadatoshi.ca"
  set_role
  set :ruby_version, "ruby 2.0.0"
  set :ruby_directory, "ruby-2.0.0-p0"
  set :deploy_to, "~/apps/#{application}"
  set_default_environment
end

task :production do
  set :rails_env, "production"
  set :location, "solargeometryapi.tadatoshi.ca"
  set_role
  set :ruby_version, "ruby 2.0.0"  
  set :ruby_directory, "ruby-2.0.0-p0"
  set :deploy_to, "~/apps/#{application}"
  set_default_environment
end

task :set_default_environment do
  set :default_environment, { 
    'PATH' => "~/.rvm/rubies/#{ruby_directory}/bin:~/.rvm/gems/#{ruby_directory}/bin:~/.rvm/bin:$PATH",
    'RUBY_VERSION' => ruby_version,
    'GEM_HOME' => "~/.rvm/gems/#{ruby_directory}",
    'GEM_PATH' => "~/.rvm/gems/#{ruby_directory}" 
  }
end

set :application, "solar_geometry_api"
set :deploy_via, :remote_cache
set :use_sudo, false

set :repository,  "git@github.com:tadatoshi/solar_geometry_api.git"
set :branch, "master"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

task :set_role do
  role :web, location                          # Your HTTP server, Apache/etc
  role :app, location                          # This may be the same as your `Web` server
  role :db,  location, :primary => true # This is where Rails migrations will run
end

set :user, "ubuntu"

# ssh_options[:forward_agent] = true

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    run "mkdir -p #{shared_path}/config"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  # task :symlink_config, roles: :app do
  #   run "ln -nfs #{shared_path}/config/mongoid.yml #{release_path}/config/mongoid.yml"
  # end
  # after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end


# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end