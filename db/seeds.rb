# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all


require 'json'
require 'open-uri'

puts 'import ingredient'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

serialized_ingredients = open(url).read

ingredient = JSON.parse(serialized_ingredients)

ingredient["drinks"].each do |value|
  Ingredient.create!(name: value["strIngredient1"])
end

mojito = Cocktail.new

mojito = Cocktail.create!(name: "mojito")

Dose.create!(description: "3 feuilles",
                          cocktail: mojito,
                          ingredient: Ingredient.first)


Dose.create!(description: "6 cl",
                          cocktail: mojito,
                          ingredient: Ingredient.last)



# Dose.create!(description: "3 feuilles",
#                           cocktail: Cocktail.create(name: "sprite"),
#                           ingredient: Ingredient.first)
