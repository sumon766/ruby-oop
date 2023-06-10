require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts "List of Books:"
    @books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_people
    puts "List of People:"
    @people.each do |person|
      puts "#{person.correct_name} (#{person.class})"
    end
  end

  def create_person
    puts "Enter person details:"
    print "ID: "
    id = gets.chomp.to_i
    print "Name: "
    name = gets.chomp
    print "Age: "
    age = gets.chomp.to_i

    puts "Select person type (1 - Teacher, 2 - Student):"
    choice = gets.chomp.to_i

    case choice
    when 1
      print "Specialization: "
      specialization = gets.chomp
      person = Teacher.new(id, age, specialization, name: name)
    when 2
      print "Classroom: "
      classroom = gets.chomp
      person = Student.new(id, age, classroom, name: name)
    else
      puts "Invalid choice. Please try again."
      return
    end

    @people << person
    puts "Person created successfully!"
  end

  def create_book
    puts "Enter book details:"
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts "Book created successfully!"
  end

  def create_rental
    puts "Enter rental details:"
    print "Person ID: "
    person_id = gets.chomp.to_i
    print "Book Title: "
    book_title = gets.chomp

    person = @people.find { |p| p.id == person_id }
    book = @books.find { |b| b.title == book_title }

    if person.nil? || book.nil?
      puts "Person or book not found. Please check the ID and title."
      return
    end

    rental = Rental.new(Date.today, book, person)
    @rentals << rental
    puts "Rental created successfully!"
  end

  def list_rentals_for_person
    puts "Enter person ID:"
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }

    if person.nil?
      puts "Person not found. Please check the ID."
      return
    end

    puts "Rentals for #{person.correct_name}:"
    person.rentals.each do |rental|
      puts "#{rental.book.title} (#{rental.date})"
    end
  end

  def options
    puts <<~OPTIONS
      What would you like to do?
      1. List all books
      2. List all people
      3. Create a person
      4. Create a book
      5. Create a rental
      6. List rentals for a person
      7. Quit
    OPTIONS
  end
end
