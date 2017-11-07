def print_header
  puts "The students of Twin Peaks Academy"
  puts "--------------"
end

def print_array(students)
  students.each do |student|
      puts "#{student[:name]}"
      puts "Favourite hobby: #{student[:hobby]}"
      puts "Height: #{student[:height]}"
      puts "Country of birth: #{student[:birth_country]}"
      puts "(#{student[:cohort]} cohort)"
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
    puts "Please enter the favourite hobby of the student."
    hobby = gets.chomp
    puts "Please enter the height of the student in m."
    height = gets.chomp
    puts "Please enter the country of birth of the student."
    birth_country = gets.chomp
    students << {name: name, hobby: hobby, height: height, birth_country: birth_country, cohort: :november}
    puts "Now we have #{students.count} students"
    puts "---"
    puts "Please enter the name of the student."
    name = gets.chomp
  end
  students
end

students = input_students

print_header
print_array(students)
print_footer(students)
