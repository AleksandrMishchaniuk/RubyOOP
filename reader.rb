class Reader
  extend DataManager
  attr_reader :id, :name, :email, :city, :street, :house
  @@current_id = 0
  @@instances = []

  def initialize(id, name, email, city, street, house)
    @id = id.to_i
    @name = name.to_s
    @email = email.to_s
    @city = city.to_s
    @street = street.to_s
    @house = house.to_s
    @orders = []
    @@instances << self
  end 

  def to_str(glue = ', ')
    id.to_s + glue + name + glue + email + glue + city + glue + street + glue + house
  end

  def add_order(order)
    @orders << order
  end

  def orders
    @orders
  end

end