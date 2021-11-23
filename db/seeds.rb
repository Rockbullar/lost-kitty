# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10 breeds of dogs

# for each breed, 10 pets


require 'json'
require 'open-uri'
require 'faker'

url = 'https://dog.ceo/api/breeds/list/all'
pets_serialized = URI.open(url).read
pets_hash = JSON.parse(pets_serialized)

pets_hash['message'].keys.sample(10).each do |breed|
  10.times do |number|
    url_image = "https://dog.ceo/api/breed/#{breed.to_s}/images/random"
    img_hash = URI.open(url_image).read
    img_string = JSON.parse(img_hash)
    pet = Pet.new(
      breed: breed.to_s,
      name: Faker::GreekPhilosophers.name,
      img: img_string['message']
    )
    pet.save!
    p pet
  end
end

puts 'seed done'
