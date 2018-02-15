# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'Cleaning database...'
Ingredient.destroy_all

puts 'Creating ingredients...'
puts 'Creating cocktails...'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_serialized = open(url).read
drinks = JSON.parse(drinks_serialized)

drinks["drinks"].each do |drink|
  drink["strIngredient1"]
  Ingredient.create(name: "#{drink["strIngredient1"]}")
end

cocktails_attributes = [
  {
    name:                'Mojito',
  },
  {
    name:                'Caïpirinha',
  },
  {
    name:                'Cuba Libre',
  },
  {
    name:                'White Russian',
  },
  {
    name:                'Planteur',
  }
]

Cocktail.create!(cocktails_attributes)

puts 'Finished! Cocktails & ingredients have been created!'
