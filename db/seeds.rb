# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Creating 10 fake studios...'
10.times do
  EQUIPMENT = [ "Digital Audio workstation", "Audio interface", "Microphones", "Monitor" ]
  studio = Studio.new(
    name:    Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    equipment: EQUIPMENT.sample,
    rate: rand(50..100).to_i,
    user_id: 1
  )
  studio.save!
end
puts 'Finished!'