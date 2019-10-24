# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'table_print'

Patient.destroy_all
Doctor.destroy_all
City.destroy_all
Appointment.destroy_all
Specialty.destroy_all

# CREATION VILLES
city1 = City.create(name: "Tourcoing")
city2 = City.create(name: "Saint-Nazaire")
city3 = City.create(name: "Mulhouse")
city4 = City.create(name: "Valenciennes")
city5 = City.create(name: "Nancy")
city = [city1, city2, city3, city4, city5]

puts "5 villes ont été créées"

# CREATION PATIENTS
patients =[]
1000.times do
patients << Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: city.sample)
end
puts "1000 patients ont été créés"

#CREATION DOCTEURS
doctors = []
150.times do
doctors << Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city: city.sample)
end
puts "150 medecins ont été créés"

#CREATION RDV
450.times do
rdv = Appointment.create!(doctor: doctors.sample, patient: patients.sample, city: city.sample)
end
puts "450 rdv ont été créés"

# CREATION SPECIALITES
specialties =[]
12.times do
specialties << Specialty.create!(name: Faker::Superhero.power)
end
puts "12 fuckin' specialties ont été créées"

# CREATION TABLE JOINTURE
150.times do
join = JoinTableSpecialtyDoctor.create!(doctor: doctors.sample, specialty: specialties.sample)
end