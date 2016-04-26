require './entity.rb'

class Book < Entity
	attr_reader :id, :title, :author, :orders

  def initialize(id, title, author)
    @id = id.to_i
    @title = title.to_s
    @author = Author.get_by_id(author.to_i)
    @@instances << self
  end	
end