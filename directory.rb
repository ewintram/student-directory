require 'date'

def print_header
  puts "The students of Twin Peaks Academy"
  puts "--------------"
end

def print_array_by_cohort(students)
  cohorts = students.sort_by do |student|
      student[:cohort]
  end
  cohorts.select do |student|
    if student[:cohort] == :January
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
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
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    puts "Please enter the name of the student."
    name = gets.chomp
  end
  students
end

students = input_students

print_header
print_array_by_cohort(students)
print_footer(students)
