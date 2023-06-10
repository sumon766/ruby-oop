require_relative 'nameable'
require_relative 'base_decorator'
require_relative 'rental'

class Person < Nameable
  attr_accessor :id, :age, :name, :parent_permission, :rentals

  def initialize(id, age, name: 'Unknown', parent_permission: true)
    super()
    @id = id
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  def add_rental(book, date)
    Rental.new(book, self, date)
  end
end
