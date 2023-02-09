# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

p 'Destroying records'

User.destroy_all
Project.destroy_all
Test.destroy_all
Review.destroy_all

# "user_#{i}@user.io",



  p 'Creating user'

  # 27.times do |i|

  # email = Faker::Internet.email
  # first_name = Faker::Name.first_name
  # last_name = Faker::Name.last_name
  # username = Faker::Internet.username

  # user_i = User.create!(
  #   email: email,
  #   first_name: first_name,
  #   last_name: last_name,
  #   username: username,
  #   password: 123456)
  # end

file = URI.open('https://res.cloudinary.com/dreamfighterjourney/image/upload/v1623229346/michael-dam-mEZ3PoFGs_k-unsplash_tlsc87.jpg')
  user_zero = User.create!(
    email: 'freddy@project-independent.com',
    first_name: 'Freddy',
    last_name: 'Independet',
    username: 'Freddy_Independent',
    password: 123456)
    user_zero.photo.attach(io: file, filename: 'sarah.jpg', content_type: 'image/jpg')
