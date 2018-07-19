# config valid for current version and patch releases of Capistrano
lock "~> 3.10.2"

set :application, "set application name here"
set :repo_url, "set git repo here"

# set to deploy only what is in the src directory
set :repo_tree, 'src/'

# how many old releases de we want to keep
set :keep_releases, 5

# files we want symlinked to specific entries in shared
set :linked_files, %w{}

# dirs we want symlinked to specific entries in shared
set :linked_dirs, %w{}

# run scripts
namespace :deploy do 

end
