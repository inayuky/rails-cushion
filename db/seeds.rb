# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(name: "kami", email: "kami@kami.com", password: "kami")

USER_NUM = 50
POST_NUM = 300

USER_NUM.times do
  name = Faker::Name.first_name.downcase
  User.create!(name: name, email: Faker::Internet.email(name: name), password: "password")
end

POST_NUM.times do
  user = User.find(rand(1..USER_NUM))
  post = user.posts.build(content: Faker::Lorem.paragraph)
  post.save!
end