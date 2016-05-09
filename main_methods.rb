def show_often_reader(lib)
  puts "+++ Who often takes the book ++++++++++++++"
  puts lib.get_often_reader.to_str(' -- ')
  puts "+++++++++++++++++++++++++++++++++++++++++++++++++"
end

def show_most_popular_book(lib)
  puts "+++ What is the most popular book ++++++++"
  puts lib.get_most_popular_book.to_str(' -- ')
  puts "+++++++++++++++++++++++++++++++++++++++++++++++++"
end

def show_count_readers_ordered_three_popular_book(lib)
  puts "+++ How many people ordered one of the three most popular books ++++++++"
  puts lib.get_count_readers_ordered_three_popular_book
  puts "+++++++++++++++++++++++++++++++++++++++++++++++++"
end

def show_help
  help = <<HELP
You should use one of next parameters:
  often_readers           ==>>  show who often takes the book
  most_popular_book       ==>>  show what is the most popular book
  count_readers_ordered_three_popular_book   ==>>  show how many people ordered one of the three most popular books
  all_tasks               ==>>  show information from three previous parameters
HELP
puts help
end