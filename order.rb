class Order
  extend DataManager
	attr_reader :id, :book, :reader, :date
	@@current_id = 0
  @@instances = []

  def initialize(id, book, reader, date)
    @id = id.to_i
    @book = case book.class
              when Book  then book
              else            Book.get_by_id(book.to_i)
            end
    @reader = case reader.class
                when Reader  then reader
                else              Reader.get_by_id(reader.to_i)
              end
    @date = date
    @@instances << self
    @book.add_order(self)
    @reader.add_order(self)
  end	

  def to_str(glue = ', ')
    id.to_s + glue + book.id.to_s + glue + reader.id.to_s + glue + date
  end

end