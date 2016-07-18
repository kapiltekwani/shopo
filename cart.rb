class Cart
  attr_reader :fruits, :shopping_amount, :items

  def initialize(fruits, shopping_amount)
    @fruits = fruits || []
    @shopping_amount = shopping_amount
    @items = Hash.new{|h,k| h[k] = 0}
  end

  def can_buy?
    shopping_amount > 0 && fruits.any?{|fruit| shopping_amount >= fruit.price }
  end

  def purchase!
    fruits.each do |fruit|
      if (shopping_amount >= fruit.price)
        items[fruit.name] =  items[fruit.name] + 1
        @shopping_amount = @shopping_amount - fruit.price
      end
    end unless fruits.empty?
  end

  def print_contents
    result = String.new

    items.each_pair {|key, value|  result << "#{value}kg #{key.capitalize}, "}

    result
  end
end