require 'date'

def print_header
  puts "The students of Twin Peaks Academy"
  puts "--------------"
end

def print_array(students)
  students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

def input_students
  puts "To finish, just hit return twice."
  puts "Please enter the name of the student."
  name = gets.chomp
  students = []
  while !name.empty? do
    puts "Please enter the cohort of the student."
    cohort = gets.chomp
    cohort = "November" if cohort.empty?
    while Date::MONTHNAMES.include?(cohort) == false
      puts "Please check your spelling and try again"
      cohort = gets.chomp
    end
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    puts "Please enter the name of the student."
    name = gets.chomp
  end
  students
end

students = input_students

print_header
print_array(students)
print_footer(students)
