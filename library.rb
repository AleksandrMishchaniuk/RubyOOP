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
    readers.select { |reader| reader.orders.size > 1 }
  end
#------------------------------------------
  def get_books_rating
    books.sort do |x, y|
      y.orders.size <=> x.orders.size
    end
  end
#--------------------------------------------
  def get_most_popular_book
    get_books_rating[0]
  end
#-----------------------------------------------
  def get_readers_ordered_three_popular_book
    readers = []
    get_books_rating.take(3).each do |book|
      book.orders.each { |order| readers << order.reader }
    end
    readers.uniq
  end

  def get_count_readers_ordered_three_popular_book
    get_readers_ordered_three_popular_book.size
  end

end