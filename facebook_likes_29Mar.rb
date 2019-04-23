# We are all familiar with likes. Someone posts a photo or makes a post. When the post is first released:

# * If no one likes it, it says a sad 'no one likes this' underneath it
# * If one person likes it - it says '#{name} likes this'
# * If two people like it - it says '#{name} and #{name} like this'
# * If 3 people like it - it says '#{name}, #{name} and #{name} like this'
# * If 4 or more people like it - it says '#{name}, #{name} and #{num} others like this', where the two names are the most recent in the array, and the num is the remaining amount of people

# Create a method that will take an array of people's names, and will return who has liked the post. Make sure you get the grammar correct!:

# *E.g. facebook_likes(["Alex"]) should return "Alex likes this"
# *E.g. facebook_likes(["Alex", "Garret", "Paul", "Aleisha", "Sarah"]) should return "Alex, Garret and 3 others like this"

def facebook_likes(arr)
    i = 0
    case arr.length
    when 0
        puts "No one likes this"
    when 1
        puts "#{arr[i]} likes this"
    when 2
        puts "#{arr[i]} and #{arr[i+1]} like this"
    when 3
        puts "#{arr[i]}, #{arr[i+1]} and #{arr[i+2]} like this"
    else
        puts "#{arr[i]}, #{arr[i+1]} and #{arr.length - 2} others like this"
    end
end

facebook_likes([])
facebook_likes(["Alex"])
facebook_likes(["Alex", "Garret"])
facebook_likes(["Alex", "Garret", "Paul"])
facebook_likes(["Alex", "Garret", "Paul", "Aleisha", "Sarah"])