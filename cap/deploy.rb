# config valid only for Capistrano 3.1
lock '3.4.0'

############################################
# Setup project
############################################

set :application, "juicevcr"
set :repo_url, "git@github.com:paulcarvill/JuiceVCR.git"
set :scm, :git

set :git_strategy, SubmoduleStrategy

############################################
# Local db details
############################################

set :local_db_host, "localhost"
set :local_db_name, "foo"
set :local_db_user, "root"
set :local_db_password, "password"

############################################
# Setup Capistrano
############################################

set :log_level, :info
set :use_sudo, false
set :deploy_as, 'www-data:www-data'

set :ssh_options, {
	forward_agent: true,
	paranoid: true
}

set :keep_releases, 3
set :keep_db_backups, 3

############################################
# Linked files and directories (symlinks)
############################################

namespace :deploy do

	desc "create files for symlinking"
	task :symlink do
		on roles(:app) do
			execute "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
			execute "ln -nfs #{shared_path}/craft/app #{release_path}/craft/app"
			execute "ln -nfs #{shared_path}/craft/storage #{release_path}/craft/storage"
		end
	end
	after :finished, :symlink

	desc "Creates robots.txt for non-production envs"
	task :create_robots do
		on roles(:app) do
			if fetch(:stage) != :production then
				io = StringIO.new('User-agent: * Disallow: /')
				upload! io, File.join(release_path, "robots.txt")
				execute :chmod, "644 #{release_path}/robots.txt"
			end
		end
	end

	after :finished, :create_robots
	after :finishing, "deploy:cleanup"
end
