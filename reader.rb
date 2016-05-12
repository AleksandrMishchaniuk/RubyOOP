require './entity.rb'

class Reader < Entity
  attr_reader :id, :name, :email, :city, :street, :house, :orders

  def initialize(id, name, email, city, street, house)
    @id = id.to_i
    @name = name.to_s
    @email = email.to_s
    @city = city.to_s
    @street = street.to_s
    @house = house.to_s
    @@instances << self
  end 
end