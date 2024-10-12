require 'csv'

file = File.join(Rails.root, "db", "recipe-pizza-data.csv")
CSV.foreach(file) do |row|
  title = row[0]
p title
  ingredients = row[1]
p ingredients
  directions = row[2]
p directions
  user_id = row[3]
p user_id

  Recipe.create(title: title, ingredients: ingredients, directions: directions, user_id: user_id)
end
