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
    readers_group = orders.group_by { |order| order.reader }
    readers_group.max_by { |reader, orders| orders.size }[0]
  end
#------------------------------------------
  def get_books_rating
    books_group = orders.group_by { |order| order.book }
    books_group.sort_by { |book, orders| orders.size }.reverse
  end
#--------------------------------------------
  def get_most_popular_book
    get_books_rating[0][0]
  end
#-----------------------------------------------
  def get_readers_ordered_three_popular_book
    orders_stack = get_books_rating.take(3).map { |item| item[1] }
    orders_stack.flatten.map { |order| order.reader }.uniq
  end

  def get_count_readers_ordered_three_popular_book
    get_readers_ordered_three_popular_book.size
  end

end