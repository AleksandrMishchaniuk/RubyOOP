require './author.rb'
require './reader.rb'
require './book.rb'
require './order.rb'

class Library
	attr_reader :books, :readers, :orders, :authors
  
  def initialize
    @authors = Author.init
    @readers = Reader.init
    @books = Book.init
    @orders = Order.init
  end	

  def save
    Book.save
    Reader.save
    Order.save
    Author.save
  end

#-----------------------------------------
  def get_often_readers
    readers.select do |reader|
      orders.count{ |order| order.reader.id == reader.id } > 1
    end
  end
#------------------------------------------
  def get_books_rating
    books.sort_by do |book|
      -orders.count { |order| order.book.id == book.id }
    end
  end
#--------------------------------------------
  def get_most_popular_book
    get_books_rating[0]
  end
#-----------------------------------------------
  def get_readers_ordered_three_popular_book
    orders_stack = orders.select do |order|
      get_books_rating.take(3).include?(order.book)
    end
    readers_stack = orders_stack.map { |order| order.reader }
    readers_stack.uniq
  end

  def get_count_readers_ordered_three_popular_book
    get_readers_ordered_three_popular_book.size
  end

end