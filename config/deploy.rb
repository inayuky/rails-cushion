# config valid for current version and patch releases of Capistrano
lock "~> 3.17.0"

# アプリ名
set :application, "rails-cushion"

# GitHubリポジトリ情報
set :repo_url, "git@github.com:inayuky/rails-cushion.git"

# デプロイするブランチ
set :branch, "main"

# デプロイ先
set :deploy_to, "/home/ec2-user/deploy/rails-cushion"

# rbenvをユーザレベルでインストール
set :rbenv_type, :user
# rubyのバージョンを指定
set :rbenv_ruby, File.read('.ruby-version').strip

append :linked_files, 'config/credentials/production.key'
append :linked_dirs, "log", "tmp/pids", "tmp/sockets"