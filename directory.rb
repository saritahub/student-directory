#Student names in an array
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
]

#Print list of students
def print_header 
    puts "The students of Villans Academy"
    puts "-------------"
end 

#Iterate over the students array to print each name
def print(names) #names placeholder
    names.each do |name|
      puts name
    end 
end 

#Finally, we print the total number of students using the array.count method
def print_footer(names)  #names placeholder
    puts "Overall, we have #{names.count} great students"
end 

print_header
print(students)
print_footer(students)