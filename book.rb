require './entity.rb'

class Book < Entity
	attr_reader :id, :title, :author, :orders

  def initialize(id, title, author)
    @id = id.to_i
    @title = title.to_s
    @author = if author.is_a?(Author)
                author
              else
                Author.get_by_id(author.to_i)
              end
    @orders = []
    @@instances << self
  end	

  def add_order(order)
    @orders << order
  end

end