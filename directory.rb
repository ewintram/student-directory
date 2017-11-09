def print_header
  puts "The students of Twin Peaks Academy"
  puts "--------------"
end

def print_array(students)
  i = 0
  while students[i] do
    student = students[i]
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

def input_students
  puts "Please enter the name of the student."
  puts "To finish, just hit return twice."
  name = gets.chomp
  students = []
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

students = input_students

print_header
print_array(students)
print_footer(students)
