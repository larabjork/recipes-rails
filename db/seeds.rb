# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.destroy_all

50.times do |index|
  Ingredient.create!(name: Faker::Food.ingredient, measurement: Faker::Food.measurement)
end

p "Created #{Ingredient.count} ingredients"

Recipe.destroy_all

50.times do |index|
  Recipe.create!(name: Faker::Food.dish, img: Faker::LoremFlickr.image(search_terms: ['food']), directions: Faker::Food.description)
end

p "Created #{Recipe.count} recipes"
