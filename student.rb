require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, classroom)
    super(id, age)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def assign_classroom(new_classroom)
    @classroom = new_classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
