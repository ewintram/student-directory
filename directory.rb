require 'date'

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print_array_by_cohort(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end

def print_header
  puts "The students of Twin Peaks Academy"
  puts "--------------"
end

def print_array_by_cohort(students)
  cohorts = students.sort_by do |student|
      student[:cohort]
  end
  cohorts.select do |student|
    if student[:cohort] == :November
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have 1 great student."
  else
    puts "Overall, we have #{students.count} great students."
  end
end

def input_students
  puts "To finish, just hit return twice."
  puts "Please enter the name of the student."
  name = gets.delete("\n")
  students = []
  while !name.empty? do
    puts "Please enter the cohort of the student."
    cohort = gets.delete("\n")
    cohort = "November" if cohort.empty?
    while Date::MONTHNAMES.include?(cohort) == false
      puts "Please check your spelling and try again"
      cohort = gets.delete("\n")
    end
    students << {name: name, cohort: cohort.to_sym}
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    puts "Please enter the name of the student."
    name = gets.delete("\n")
  end
  students
end

interactive_menu
