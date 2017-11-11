require 'date'
@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "To finish, just hit return twice."
  puts "Please enter the name of the student."
  name = gets.delete("\n")
  while !name.empty? do
    puts "Please enter the cohort of the student."
    cohort = gets.delete("\n")
    cohort = "November" if cohort.empty?
    while Date::MONTHNAMES.include?(cohort) == false
      puts "Please check your spelling and try again"
      cohort = gets.delete("\n")
    end
    @students << {name: name, cohort: cohort.to_sym}
    if @students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end
    puts "Please enter the name of the student."
    name = gets.delete("\n")
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Twin Peaks Academy"
  puts "--------------"
end

def print_students_list
  cohorts = @students.sort_by do |student|
      student[:cohort]
  end
  cohorts.select do |student|
    if student[:cohort] == :November
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student."
  else
    puts "Overall, we have #{@students.count} great students."
  end
end

interactive_menu
