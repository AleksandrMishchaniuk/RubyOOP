require './data_manager.rb'
require './main_methods.rb'
require './author.rb'
require './reader.rb'
require './book.rb'
require './order.rb'
require './library.rb'


lib = Library.new

case ARGV[0]
  when 'all_tasks'
    show_often_readers(lib)
    show_most_popular_book(lib)
    show_count_readers_ordered_three_popular_book(lib)
  when 'often_readers'
    show_often_readers(lib)
  when 'most_popular_book'
    show_most_popular_book(lib)
  when 'count_readers_ordered_three_popular_book'
    show_count_readers_ordered_three_popular_book(lib)
  else
    show_help
end

END { lib.save }