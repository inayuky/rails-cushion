# サーバの設定
server "52.68.39.179", user: "ec2-user", roles: %w{web db app}

# ssh接続設定
set :ssh_options, {
  user: fetch(:user),
  port: 22,
  keys: %w(~/work/terraform/ansible-test/aws_key),
  forward_agent: true,
  auth_methods: %w[publickey]
}