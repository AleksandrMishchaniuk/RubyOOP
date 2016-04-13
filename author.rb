require './entity.rb'

class Author < Entity
	attr_reader :id, :name, :biography

  def initialize(id, name, biography)
    @id = id.to_i
    @name = name.to_s
    @biography = biography.to_s
    @@instances << self
  end	

end