# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'table_print'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all

# CREATION 10 VILLES AVEC FAKER
city =[]
10.times do
city << City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end
puts "voila les 10 cities !"


# CREATION 10 UTILISATEUR AVEC FAKER
users = []
10.times do
users << User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::ChuckNorris.fact, email:Faker::Internet.email, age: rand(16..66), city: city.sample)
end
puts "voila les 10 users"


# CREATION 20 GOSSIPS
gossips =[]
20.times do
gossips << Gossip.create!(title: Faker::Hipster.sentence(word_count: 3),content: Faker::Hipster.sentence, user: users.sample)
end
puts "voila les gossips !"

# CREATION 10 TAGS
tags = []
10.times do
tags << Tag.create!(title: Faker::Hipster.words(number: 1))
end
puts "!!!!! V'la les taaaaaags !"

# CREATION PRIVATE MESSAGE
mess = []
10.times do
mess << PrivateMessage.create!(content: Faker::Hipster.sentence, user: users.sample)
end
puts "Sur ce j'ai aussi crée des messages, mais ils n'ont qu'un expéditeur....je suis pas allée jusqu'au destinataires, potentiellement multiples..."