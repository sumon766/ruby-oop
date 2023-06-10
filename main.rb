require_relative 'app'

def main
  app = App.new

  loop do
    app.options
    print "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals_for_person
    when 7
      puts "Exiting the app..."
      break
    else
      puts "Invalid choice. Please try again."
    end

    puts "\n"
  end
end

main
