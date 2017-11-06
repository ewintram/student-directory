students = [
  {name: "Laura Palmer", cohort: :november},
  {name: "Bobby Briggs", cohort: :november},
  {name: "Dr Lawrence Jacoby", cohort: :november},
  {name: "One-eyed Jack", cohort: :november},
  {name: "Dale Cooper", cohort: :november},
  {name: "Sherriff Harry S Truman", cohort: :november},
  {name: "Leland Palmer", cohort: :november},
  {name: "Audrey Horne", cohort: :november},
  {name: "Shelly Johnson", cohort: :november},
  {name: "Log Lady", cohort: :november},
  {name: "Nadine Hurley", cohort: :november}
]

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

print_header
print_array(students)
print_footer(students)
