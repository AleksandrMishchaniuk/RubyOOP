require './data_manager.rb'
require './author.rb'
require './reader.rb'
require './book.rb'
require './order.rb'
require './library.rb'


lib = Library.new

if ARGV[0] == 'tasks'
  puts "\n--- Who often takes the book ------"
  lib.get_often_readers.each { |item| puts item.to_str(' -- ') }
  puts "\n--- What is the most popular book ---"
  puts lib.get_most_popular_book.to_str(' -- ')
  puts "\n--- How many people ordered one of the most popular books ---"
  puts lib.get_count_readers_ordered_three_popular_book
  puts "----------------------------------\n\n"
end

lib.save