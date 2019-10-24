# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'table_print'

Dogsitter.destroy_all
Dog.destroy_all
Stroll.destroy_all
City.destroy_all

# CREATION DES VILLES
city =[]
city1 = City.create(name: "Oran")
city2 = City.create(name: "Constantine")
city3 = City.create(name: "Annaba")
city4 = City.create(name: "Batna")
city5 = City.create(name: "Tlemcen")
city = [city1, city2, city3, city4, city5]

puts "Finalement, on va peut être en profiter pour réviser la Géo... 5 villes ont été créées"

# CREATION DES CHIENNASSES
dogsitters = []
100.times do
dogsitters << Dogsitter.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: rand(16..66), city: city.sample)
end
puts "100 dogsitters ont été créés"

# CREATION DES CHIENS
dogs = []
500.times do
dogs << Dog.create!(name: Faker::Superhero.name, age: rand(1..12), city: city.sample)
end
puts "Maintenant 500 chiens ont été rajoutés"

# CREATION DES PROMENADES
365.times do
strolls = Stroll.new(date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 120), city: city.sample)
strolls.dogsitter_id = Dogsitter.where(city_id: strolls.city_id).pluck(:id).sample  #pluck te renvoie l'array des dogsitter qui sont dans la bonne ville.
strolls.save
end
	
puts "Voila, même les promenades sont datées !"