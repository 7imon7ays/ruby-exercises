class Student
  def initialize(first, last)
    @name = first + " " + last
    @courses = []
  end

  def courses
    @courses
  end

  def enroll(a_course)
    if @courses.any? {|course| course.conflicts?(a_course)}
      "Timeslot occupied!"
    else
      a_course.add_student(self)
      @courses << a_course
    end
  end

  def course_load
    credits_by_department = Hash.new(0)
    @courses.each do |course|
      credits_by_department[course.department] += course.num_credits
    end
    credits_by_department
  end
end

class Course
  attr_reader :department, :num_credits, :days, :time_block

  def initialize(name, department, num_credits, days = [], time_block = 0)
    @name = name
    @department = department
    @num_credits = num_credits
    @students = []
    @days = days
    @time_block = time_block
  end

  def students
    @students
  end

  def add_student(student)
    @students << student
  end

  def conflicts?(course2)
    @days.any? {|day| course2.days.include?(day)} && @time_block == course2.time_block
  end
end






