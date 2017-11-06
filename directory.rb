students = [
  "Laura Palmer",
  "Bobby Briggs",
  "Dr Lawrence Jacoby",
  "One-eyed Jack",
  "Dale Cooper",
  "Sherriff Harry S Truman",
  "Leland Palmer",
  "Audrey Horne",
  "Shelly Johnson",
  "Log Lady",
  "Nadine Hurley"
]

def print_header
  puts "The students of Twin Peaks Academy"
  puts "--------------"
end

def print_names(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

print_header
print_names(students)
print_footer(students)
