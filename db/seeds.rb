# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb
# db/seeds.rb
# db/seeds.rb
puts 'Cleaning database...'
Ingredient.destroy_all
puts 'Creating Ingredients...'
ingredient_list = ['Mint', 'Vodka', 'Rhum', 'Tequila', 'OrangeJuice', 'Tomato Juice', 'Ice']
cocktail_list = ['Mojito', 'Bloody Mary', 'Sex on the Beach', 'Margarita', 'Pina colada']
ingredient_list.each do |ingredient|
  Ingredient.create!(
    name: ingredient)
  puts "Created #{Ingredient.name}: #{ingredient}"
end
puts ''
cocktail_list.each do |cocktail|
  Cocktail.create!(
    name: cocktail)
  puts "Created #{Cocktail.name}: #{cocktail}"
end
puts ''
dose_list = [['6 leaves', 1, 1], ['1,5 oz', 1, 3], ['4,5 cl', 2, 2],
             ['9 cl', 2, 6], ['1,33 oz', 3, 2], ['1,33 oz', 3, 5], ['2cl', 4, 4]]
dose_list.each do |dose|
  Dose.create!(
    description: dose[0],
    cocktail_id: dose[1],
    ingredient_id: dose[2],
    )
  puts "Created Dose: #{dose}"
end
puts 'Finished!'
