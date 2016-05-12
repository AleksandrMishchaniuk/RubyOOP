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
  def get_often_reader
    orders.group_by { |order| order.reader }
        .max_by { |reader, orders| orders.size }[0]
  end
#------------------------------------------
  def get_books_rating
    orders.group_by { |order| order.book }
        .sort_by { |book, orders| orders.size }.reverse
  end
#--------------------------------------------
  def get_most_popular_book
    get_books_rating[0][0]
  end
#-----------------------------------------------
  def get_readers_ordered_three_popular_book
    get_books_rating.take(3).map { |item| item[1] }
        .flatten.map { |order| order.reader }.uniq
  end

  def get_count_readers_ordered_three_popular_book
    get_readers_ordered_three_popular_book.size
  end

end