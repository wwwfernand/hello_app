# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
User.create!(name:  "Admin",
             email: "admin@tickleup.com",
             password:              "tickleup.com",
             password_confirmation: "tickleup.com",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "Guest",
             email: "guest@tickleup.com",
             password:              "tickleup.com",
             password_confirmation: "tickleup.com",
             admin:     false,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@tickleup.com"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

# Microposts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }