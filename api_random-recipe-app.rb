require "httparty"
require "json"

response = HTTParty.get("https://www.themealdb.com/api/json/v1/1/random.php")
parsed_meals = JSON.parse(response.body)

puts "Welcome to the Random Recipe Database!"
puts "Would you like a random recipe to try out? (Y) Yes or (N) No"
choice = gets.chomp.upcase

while choice != "Y" && choice != "N" && choice != "YES" && choice != "NO"
    puts "Press Y to get a recipe, or N to exit"
    choice = gets.chomp.upcase
end
    
if choice == "Y" || choice == "YES"
    puts "\n" + parsed_meals["meals"][0].values_at("strMeal").join.upcase + "\n \n" + parsed_meals["meals"][0].values_at("strMeasure1", "strIngredient1").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure2", "strIngredient2").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure3", "strIngredient3").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure5", "strIngredient5").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure6", "strIngredient6").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure7", "strIngredient7").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure8", "strIngredient8").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure9", "strIngredient9").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure10", "strIngredient10").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure11", "strIngredient11").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure12", "strIngredient12").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure13", "strIngredient13").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure14", "strIngredient14").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure15", "strIngredient15").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure16", "strIngredient16").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure17", "strIngredient17").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure18", "strIngredient18").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strMeasure19", "strIngredient19").join(" ") + "\n" + parsed_meals["meals"][0].values_at("strInstructions").join(" ") + "\n\nWatch the recipe video: " + parsed_meals["meals"][0].values_at("strYoutube").join(" ") + "\n\nSee the original recipe: " + parsed_meals["meals"][0].values_at("strSource").join(" ") + "\n\n"
    
    puts "Enjoy your meal!"
else
    puts "Thank you, have a nice day"
end
