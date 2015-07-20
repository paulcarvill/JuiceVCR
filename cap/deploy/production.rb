# Define roles, user and IP address of deployment server
role :app, %w{root@46.101.57.244}
set :stage, :production

server '46.101.57.244', user: 'root', roles: %w{app}

set :branch, "master"
set :deploy_to, "/var/www/domain.com/"

set :db_host, "localhost"
set :db_name, "foo"
set :db_user, "root"
set :db_password, "uIgZICLfSV"