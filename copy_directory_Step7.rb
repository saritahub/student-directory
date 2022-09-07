#Student names in an array
# students = [
#     {name: "Dr. Hannibal Lecter", cohort: :november},
#     {name: "Darth Vader", cohort: :november},
#     {name: "Nurse Ratched", cohort: :november},
#     {name: "Michael Corleone", cohort: :november},
#     {name: "Alex DeLarge", cohort: :november},
#     {name: "The Wicked Witch of the West", cohort: :november},
#     {name: "Terminator", cohort: :november},
#     {name: "Freddy Krueger", cohort: :november},
#     {name: "The Joker", cohort: :november},
#     {name: "Joffrey Baratheon", cohort: :november},
#     {name: "Norman Bates", cohort: :november}
# ]

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice" #So 'name' will be empty, and while loop breaks 
    students = []
    name = gets.chomp
    
    while !name.empty? do 
        #New hash pushed to students array
        #key = name: = value of name, value = cohort: :november (hardcoded)
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end
    students #return array of hashes of the students 
end 

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

students = input_students #The outcome of the method input_students 
print_header
print(students) #Again, outcome of method input_students
print_footer(students) #Outcome of method input_students

