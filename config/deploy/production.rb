# サーバの設定
server "54.248.147.225", user: "ec2-user", roles: %w{web db app}

# ssh接続設定
set :ssh_options, {
  user: fetch(:user),
  port: 22,
  keys: %w(~/work/terraform-sampler/ec2-ssh/ec2_key),
  forward_agent: true,
  auth_methods: %w[publickey]
}