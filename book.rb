class Book
  extend DataManager
	attr_reader :id, :title, :author
	@@current_id = 0
  @@instances = []

  def initialize(id, title, author)
    @id = id.to_i
    @title = title.to_s
    @author = case author.class
                when Author  then author
                else              Author.get_by_id(author.to_i)
              end
    @orders = []
    @@instances << self
  end	

  def to_str(glue = ', ')
    id.to_s + glue + title + glue + author.id.to_s
  end

  def add_order(order)
    @orders << order
  end

  def orders
    @orders
  end

end