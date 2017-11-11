require "csv"
@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to chosen file"
  puts "4. Load the list from chosen file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      puts "Type your file name"
      save_students(STDIN.gets.chomp)
    when "4"
      puts "Type your file name"
      load_students(STDIN.gets.chomp)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again."
  end
end

def input_students
  puts "Please enter the name of the student."
  puts "To finish, just hit return twice."
  @name = STDIN.gets.chomp
  while !@name.empty? do
    @cohort = :november
    populate_student_list
    puts "Now we have #{@students.count} students"
    puts "Please enter the name of the student."
    @name = STDIN.gets.chomp
  end
end

def populate_student_list
  @students << {name: @name, cohort: @cohort}
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
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student."
  else
    puts "Overall, we have #{@students.count} great students."
  end
end

def save_students(filename)
  CSV.open(filename, "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end
  puts "#{@students.count} students saved to #{filename}"
end

def load_students(filename)
  CSV.foreach(filename) do |line|
    @name, @cohort = line[0], line[1]
    @cohort.to_sym
    populate_student_list
  end
  puts "#{@students.count} students loaded from #{filename}"
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
