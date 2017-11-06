def print_header
  puts "The students of Twin Peaks Academy"
  puts "--------------"
end

def print_array(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

def input_students
  puts "Please enter the names of the students."
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
