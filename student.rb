require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, classroom, name: 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def assign_classroom(new_classroom)
    @classroom = new_classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
