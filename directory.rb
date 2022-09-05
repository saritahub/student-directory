#Student names in an array
students = [
    {name: "Dr. Hannibal Lecter", cohort: :november},
    {name: "Darth Vader", cohort: :november},
    {name: "Nurse Ratched", cohort: :november},
    {name: "Michael Corleone", cohort: :november},
    {name: "Alex DeLarge", cohort: :november},
    {name: "The Wicked Witch of the West", cohort: :november},
    {name: "Terminator", cohort: :november},
    {name: "Freddy Krueger", cohort: :november},
    {name: "The Joker", cohort: :november},
    {name: "Joffrey Baratheon", cohort: :november},
    {name: "Norman Bates", cohort: :november}
]

#Print list of students
def print_header 
    puts "The students of Villans Academy"
    puts "-------------"
end 

#Iterate over the students array to print each name
def print(students) #names placeholder
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end 
end 

#Finally, we print the total number of students using the array.count method
def print_footer(names)  #names placeholder
    puts "Overall, we have #{names.count} great students"
end 

print_header
print(students)
print_footer(students)