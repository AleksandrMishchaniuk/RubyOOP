require './entity.rb'

class Order < Entity
  attr_reader :id, :book, :reader, :date

  def initialize(id, book, reader, date)
    @id = id.to_i
    @book = if book.is_a?(Book)
               book
            else
              Book.get_by_id(book.to_i)
            end
    @reader = if reader.is_a?(Reader)
                 reader
              else
                Reader.get_by_id(reader.to_i)
              end
    @date = date
    @@instances << self
    # p @book
    # p @reader
    @book.add_order(self)
    @reader.add_order(self)
  end 

  def to_str(glue = ', ')
    id.to_s + glue + book.id.to_s + glue + reader.id.to_s + glue + date
  end

end