require "httparty"
require "json"
require "artii"
require "colorize"

def run_cocktails
    @a = Artii::Base.new

    puts @a.asciify("Make A Cocktail!")
    puts "What cocktail would you like to make today?"
    @choice = gets.chomp

    response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{@choice}")

    if response["drinks"].length - 1 > 0
        puts "\nThere are #{response["drinks"].length} versions of the #{@choice}"
    end

    i = 0
    while i <= response["drinks"].length - 1
        puts "\n#{response["drinks"][i]["strDrink"].upcase.colorize(:blue).bold} \n\n"
        ingredients = []
        x = 1
        counter = 0
        while counter < response["drinks"].length
            response["drinks"][i].each do |ingredient|
                ingredients << "#{response["drinks"][i]["strMeasure#{x}"]} #{response["drinks"][i]["strIngredient#{x}"]}"
                x += 1
            end 
            counter += 1
        end
        puts "Ingredients".upcase.colorize(:light_black).bold
        ingredients.each do |ingredient|
            if ingredient.length > 2
                puts ingredient.lstrip
            end
        end

        puts "\nInstructions".upcase.colorize(:light_black).bold + "\n#{response["drinks"][i]["strInstructions"]} \n\n"
        i += 1
    end

    puts "Enjoy your #{@choice.capitalize}!\n".colorize(:green)
end

run_cocktails

# class CocktailModel
#     def initialize
#         @a = Artii::Base.new
#     end
    
#     def create(choice)
#         @response = HTTParty.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{choice}")
#     end
# end



# class CocktailView
#     def greeting
#         puts @a.asciify("Make A Cocktail!")
#         puts "What cocktail would you like to make today?"
#         choice = gets.chomp
#     end

#     def farewell
#         puts "Enjoy your #{choice.capitalize}!\n".colorize(:green)
#     end
# end


# class CocktailController
#     def initialize
#         @view = CocktailView.new
#         @model = CocktailModel.new
#     end
    
#     def run
#         @view.greeting

#         if response["drinks"].length - 1 > 0
#             choice = @view.greeting
#             puts "\nThere are #{response["drinks"].length} versions of the #{choice}"
#         end
        
#         i = 0
#         while i <= response["drinks"].length - 1
#             puts "\n#{response["drinks"][i]["strDrink"].upcase.colorize(:blue).bold} \n\n"
#             ingredients = []
#             x = 1
#             counter = 0
#             while counter < response["drinks"].length
#                 response["drinks"][i].each do |ingredient|
#                     ingredients << "#{response["drinks"][i]["strMeasure#{x}"]}#{response["drinks"][i]["strIngredient#{x}"]}"
#                 # if response["drinks"][i]["strIngredient#{x}"] != ""
#                 #     ingredients << "#{response["drinks"][i]["strMeasure#{x}"]} #{response["drinks"][i]["strIngredient#{x}"]}"
#                     x += 1
#                 end 
#                 counter += 1
#             end
#             puts "Ingredients".upcase.colorize(:light_black).bold
#             ingredients.each do |ingredient|
#                 if ingredient.length > 2
#                     puts ingredient
#                 end
#             end
        
#             puts "\nInstructions".upcase.colorize(:light_black).bold + "\n#{response["drinks"][i]["strInstructions"]} \n\n"
#             i += 1
#         end
#         @view.farewell
#     end
# end


