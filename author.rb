class Author
  extend DataManager
	attr_reader :id, :name, :biography
	@@current_id = 0
  @@instances = []

  def initialize(id, name, biography)
    @id = id.to_i
    @name = name.to_s
    @biography = biography.to_s
    @@instances << self
  end	

  def to_str(glue = ', ')
    id.to_s + glue + name + glue + biography
  end
  
end
