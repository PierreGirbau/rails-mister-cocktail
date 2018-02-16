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
Dose.destroy_all
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

url = "https://images.unsplash.com/photo-1510626176961-4b57d4fbad03?ixlib=rb-0.3.5&s=4e9face33a62237d5846e32db4fa114e&auto=format&fit=crop&w=634&q=80"
cocktail = Cocktail.new(name: 'Mojito')
cocktail.remote_photo_url = url
cocktail.save

url = "https://images.unsplash.com/photo-1511122979121-77a44e2cbdfe?ixlib=rb-0.3.5&s=f9b4ae31712fb0462e301dc27d057213&auto=format&fit=crop&w=634&q=80"
cocktail = Cocktail.new(name: 'Bloody Mary')
cocktail.remote_photo_url = url
cocktail.save

url = "http://img-3.journaldesfemmes.fr/zCAYuSqJpy8SEKKK4ao5oLaSqRI=/750x/smart/35fab4d44e9c4172b7228794f654ea02/recipe-jdf/10025521.jpg"
cocktail = Cocktail.new(name: 'Caïpirinha')
cocktail.remote_photo_url = url
cocktail.save

url = "https://www.gutekueche.at/img/rezept/17941/cuba-libre.jpg"
cocktail = Cocktail.new(name: 'Cuba Libre')
cocktail.remote_photo_url = url
cocktail.save

url = "http://bakingbites.com/wp-content/uploads/2016/09/DSC_1228.jpg"
cocktail = Cocktail.new(name: 'White Russian')
cocktail.remote_photo_url = url
cocktail.save

url = "https://images.unsplash.com/photo-1461023058943-07fcbe16d735?ixlib=rb-0.3.5&s=49bf50f8cb823c2fb0054028c77f55df&auto=format&fit=crop&w=1050&q=80"
cocktail = Cocktail.new(name: 'Irish Coffee')
cocktail.remote_photo_url = url
cocktail.save

url = "https://images.unsplash.com/photo-1414450397866-85f90db48714?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=fdff95435109c814de8b1bb4b468abd3&auto=format&fit=crop&w=1050&q=80"
cocktail = Cocktail.new(name: 'Planteur')
cocktail.remote_photo_url = url
cocktail.save

url = "http://img.facv.pmdstatic.net/fit/http.3A.2F.2Fdata.2Evodemotion.2Ecom.2F31828.2F31828.2Ejpg/1280x720/quality/80/recette-cocktail-le-ti-punch.jpg"
cocktail = Cocktail.new(name: 'Ti Punch')
cocktail.remote_photo_url = url
cocktail.save

url = "https://pixel.nymag.com/imgs/daily/grub/2017/best-of-new-york/mai-tai-suffolk-arms.w710.h473.jpg"
cocktail = Cocktail.new(name: 'Mai Tai')
cocktail.remote_photo_url = url
cocktail.save

puts 'Finished! Cocktails & ingredients have been created!'

# cocktails_attributes = [
#   {
#     name:                'Mojito',
#   },
#   {
#     name:                'Caïpirinha',
#   },
#   {
#     name:                'Cuba Libre',
#   },
#   {
#     name:                'White Russian',
#   },
#   {
#     name:                'Planteur',
#   }
# ]

# Cocktail.create!(cocktails_attributes)
