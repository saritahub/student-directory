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
puts "The students of Villans Academy"
puts "-------------"
#Iterate over the students array to print each name
students.each do |student|
    puts student
end 

#Finally, we print the total number of students using the array.count method
puts "Overall, we have #{students.count} great students"