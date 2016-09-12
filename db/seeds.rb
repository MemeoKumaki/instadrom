# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

User.create(name: 'maria', email: 'admin@example.com', password: '123456', password_confirmation: '123456' )

images = ['deer', 'fall', 'girl', 'ghost', 'house', 'kitten', 'lake', 'pool', 'sport', 'sunset', 'duck']

5.times do
  User.create(
    name: FFaker::Name.name, 
    email: FFaker::Internet.email, 
    password: '123456', 
    password_confirmation: '123456'
  )
end

users = User.all

for i in 0...images.size
  img = images[i]
  Post.create({
    :image => File.new("#{Rails.root}/app/assets/images/fixtures/#{img}.jpg"),
    body: FFaker::Lorem.phrase,
    user: users[rand(0...users.size)]
  })
end

posts = Post.all

50.times do
  Comment.create(
    body: FFaker::Lorem.sentence(3), 
    user: users[rand(0...users.size)],
    post: posts[rand(0...posts.size)]
  )
end

100.times do
  Like.create(
    post: posts[rand(0...posts.size)],
    user: users[rand(0...users.size)]
  )
end