require 'csv'
require './fruit'
require './cart'

fruits = Array.new

#Read the input CSV file
csv = CSV.parse( File.read('test.csv'), :headers => true)

#Load all the fruits from the table in hash
csv.each {|row| fruits << Fruit.new(row.to_hash) }

#Ask Sachin to enter the shopping amount
puts "Please enter the shopping amount for Sachin"

shopping_amount = gets.chomp.to_f

#Initialize a new cart for given fruit list and shopping-amount
cart = Cart.new(fruits, shopping_amount)

#Add fruits to cart till you reach shopping-amount limit
while cart.can_buy?
  cart.purchase!
end

#Print contents of the cart
puts cart.print_contents