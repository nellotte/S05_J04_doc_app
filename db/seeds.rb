# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker' 

Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all
City.destroy_all
#=> comme ça à chaque phase de test ça ne me génère pas mille instances

# Create 5 cities
City.create(name: 'Paris')
City.create(name: 'Lyon')
City.create(name: 'Lille')
City.create(name: 'Cergy')
City.create(name: 'Rennes')

5.times do
  city = City.all.sample
  Dogsitter.create(name: Faker::Name.name, city: city)
end

# Create 10 dogs
10.times do
  city = City.all.sample
  Dog.create(name: Faker::Creature::Dog.name, city: city)
end

# Create 20 strolls
20.times do
  dog = Dog.all.sample #on prend un chien au hasard
  dogsitter = Dogsitter.where(city_id: dog.city_id).sample #on cherche tous les DS qui ont city_id=Dog.city_id, et parmis tous ceux qu'on trouve, on en prend un au hasard
  city = City.find(dog.city_id) #dog.city_id = ID de la ville du au chien actuellement en cours de traitement. 

  
  Stroll.create(
    dog: dog,
    dogsitter: dogsitter,
    city: city,
    date: Faker::Date.forward(days: 30).to_s,
    datetime: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30, format: :default)
  )
end
