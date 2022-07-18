# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

puts "creating users.."
user = User.create(email: '123@mail.com', password: '123456')
user.save!
puts "User with id: #{user.id} created.."

puts "creating plants.."
plant1 = Plant.new(
  title: 'Monstera Plant',
  description: 'Tropical plant with glossy leaves',
  category: 'Tropical',
  price_per_day: 5,
  size: '20 cm',
  care_level: 'easy',
  light: 'Bright indirect sunlight',
  watering: 'Water when top soil is dry',
  pet_friendly: 'No, keep out of reach of furry friends',
  user_id: user.id
)
plant1.save!
puts "Plant with id: #{plant1.id} created.."

plant2 = Plant.new(
  title: 'Fiddle Leaf Fig',
  description: 'Decorative indoor plant that filters air',
  category: 'Tree',
  price_per_day: 7,
  size: '90 cm',
  care_level: 'easy',
  light: 'Bright indirect sunlight',
  watering: 'Water when top soil is dry',
  pet_friendly: 'No, keep out of reach of furry friends',
  user_id: user.id
)
plant2.save!
puts "Plant with id: #{plant2.id} created.."

plant3 = Plant.new(
  title: 'Rubber Ficus',
  description: 'Vibrant coloured plant, great for indoors',
  category: 'Tree',
  price_per_day: 4,
  size: '50 cm',
  care_level: 'easy',
  light: 'Bright indirect sunlight',
  watering: 'Water when top soil is dry',
  pet_friendly: 'No, keep out of reach of furry friends',
  user_id: user.id
)
plant3.save!
puts "Plant with id: #{plant3.id} created.."

puts "Finished!"
