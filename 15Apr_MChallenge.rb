# Create a method that takes a number as input and returns "This is a prime number", if its a prime number, otherwise return "This is not a prime number”

# E.g. is_it_prime(7) -> “This is a prime number”
# E.g. is_it_prime(100) -> “This is not a prime number”


require 'prime'

def is_it_prime(num)
    puts num.prime? ? "This is a prime number" : "This is not a prime number"
end

puts "Enter a number to check if it's a prime number"
user_input = gets.chomp.to_i
is_it_prime(user_input)