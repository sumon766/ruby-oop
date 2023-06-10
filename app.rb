require 'date'
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
    puts 'List of Books:'
    @books.each { |book| puts "#{book.title} by #{book.author}" }
  end

  def list_people
    puts 'List of People:'
    @people.each { |person| puts "#{person.correct_name} (#{person.class})" }
  end

  def create_person
    puts 'Select person type (1 - Teacher, 2 - Student):'
    choice = gets.chomp.to_i

    case choice
    when 1
      create_teacher
    when 2
      create_student
    else
      puts 'Invalid choice. Please try again.'
    end
  end

  def create_teacher
    puts 'Enter teacher details:'
    print 'ID: '
    id = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(id, age, specialization)
    teacher.name = name # Set the name separately
    @people << teacher
    puts 'Teacher created successfully!'
  end

  def create_student
    puts 'Enter student details:'
    print 'ID: '
    id = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Classroom: '
    classroom = gets.chomp

    student = Student.new(id, age, classroom)
    student.name = name # Set the name separately
    @people << student
    puts 'Student created successfully!'
  end

  def create_book
    puts 'Enter book details:'
    title = title_input
    author = author_input

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully!'
  end

  def create_rental
    puts 'Select a book from the following list by number'

    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end

    book_number = gets.chomp.to_i

    book = @books[book_number]

    puts 'Select a person from the following list by number (not by id)'

    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_number = gets.chomp.to_i

    person = @people[person_number]

    puts 'Date [ YYYY-MM-DD ]: '
    date = gets.chomp

    rental = Rental.new(date, book, person)

    @rentals << rental

    puts 'Rental created successfully'
  end

  def list_rentals_for_person
    person_id = person_id_input

    person = find_person_by_id(person_id)

    if person.nil?
      puts 'Person not found. Please check the ID.'
      return
    end

    puts "Rentals for #{person.correct_name}:"
    person.rentals.each { |rental| puts "#{rental.book.title} (#{rental.date})" }
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

  private

  def person_details
    print 'ID: '
    id = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    [id, name, age]
  end

  def title_input
    print 'Title: '
    gets.chomp
  end

  def author_input
    print 'Author: '
    gets.chomp
  end

  def person_id_input
    print 'Person ID: '
    gets.chomp.to_i
  end

  def book_title_input
    print 'Book Title: '
    gets.chomp
  end

  def find_person_by_id(person_id)
    @people.find { |p| p.id == person_id }
  end

  def find_book_by_title(book_title)
    @books.find { |b| b.title == book_title }
  end
end
