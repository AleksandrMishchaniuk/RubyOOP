require './entity.rb'

class Order < Entity
  attr_reader :id, :book, :reader, :date

  def initialize(id, book, reader, date)
    @id = id.to_i
    @book = Book.get_by_id(book.to_i)
    @reader = Reader.get_by_id(reader.to_i)
    @date = date
    @@instances << self
  end 
end