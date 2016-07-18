class Fruit

  attr_reader :name, :available_quantity, :price_per_kg, :discounted_days

  def initialize(csv_object)
    @name = csv_object["name"]
    @available_quantity = csv_object["available_kgs"].to_i
    @discounted_days = csv_object["discount_weekdays"].split(",").map(&:upcase)
    @price_per_kg = csv_object["perkg_price"].to_f
  end

  def price
   @discounted_days.include?(today) ? @price_per_kg/2 : @price_per_kg
  end

  private
  def today
    Date.today.strftime("%a").upcase
  end
end
