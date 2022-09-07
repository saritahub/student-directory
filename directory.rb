#Student names in an array
# studentsarr = [
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

# def input_students
#     puts "Please enter the names of the students"
#     puts "To finish, just hit return twice" #So 'name' will be empty, and while loop breaks 
#     students = []
#     name = gets.chomp
    
#     while !name.empty? do 
#         #New hash pushed to students array
#         #key = name: = value of name, value = cohort: :november (hardcoded)
#         students << {name: name, cohort: :november}
#         puts "Now we have #{students.count} students"
#         name = gets.chomp
#     end
#     students #return array of hashes of the students 
# end 
@students = [] #Empty array visible to all methods 
#Chapter 8: Exercise 5
def input_students
    puts "Please enter the student's full name:"
    puts "To finish, just hit return twice" #So 'name' will be empty, and while loop breaks 
    # students = [] #added student outside of methods
    name = gets.chomp
  
    #Add extra variables
    while !name.empty? do
      puts "Please enter your fave hobby:"
      hobby = gets.chomp
        if hobby.empty?
          break
        else 
          puts "Please enter your country of birth:"
          countryofbirth = gets.chomp 
          if countryofbirth.empty?
            break
          else 
            puts "Please enter your height in centimeters:"
            height = gets.chomp 
              if height.empty?
                break 
              else 
              @students << {name: name, cohort: :november, hobby: :hobby, countryofbirth: :countryofbirth, height: :height}

    # while !name.empty? do 
    #New hash pushed to students array
        #key = name: = value of name, value = cohort: :november (hardcoded)
      @students << {name: name, cohort: :november, hobby: hobby, countryofbirth: countryofbirth, height: height}
      puts "Now we have #{@students.count - 1} students"
        
      puts "Please enter the next student's full name:"
      name = gets.chomp
        if name.empty?
          break
        else 
          puts "Please enter your fave hobby:"
          hobby = gets.chomp
            if hobby.empty?
              break
            else 
              puts "Please enter your country of birth:"
              countryofbirth = gets.chomp 
              if countryofbirth.empty?
                break
              else 
                puts "Please enter your height in centimeters:"
                height = gets.chomp 
    
end 
    @students #return array of hashes of the students 
end
end 
end 
end 
end 
end 
end 



#Print list of students
def print_header 
    puts "The students of Villans Academy"
    puts "-------------"
end 

#Iterate over the students array to print each name
def print(students) #Student names placeholder
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

#Step 8 Exercise 4
#Replace the each loop with while or until 
#Iterate over the students array to print each name
# def print(students) #Student names placeholder
#     students 
#     until students.empty? do  
#         puts "#{students[:name]} (#{students[:cohort]} cohort)"
#         break
#     end 
# end 

#Finally, we print the total number of students using the array.count method
def print_footer(students)
    puts "Overall, we have #{@students.count - 1} great students"
  end

#Step 8 Exercise 1 - DONE :) ✅
#Print index number and student name
def studentindex(students)
    @students.each_with_index {|name, index|
        puts "#{index + 1}. #{name[:name]}"
    }
end

#Step 8 Exercise 2 - DONE :) ✅
#Only print the students whose names begin with a specific character 
#In this case, we will choose "D", this will include "Dr" for now
# def studentindex(students)
#     students.each_with_index {|name, index|    
#       if "#{name[:name][0]}" == "D"
#         puts "#{index + 1}. #{name[:name]}"
#       end
# }
# end

#Step 8 - Exercise 3 ✅
#Only print student names that are 12 characters or less 
# def studentindex(students)
#     @students.each_with_index {|name, index|    
#       beans = "#{name[:name].split(" ").join("").length}"
#       if beans.to_i.between?(1, 12)
#         puts "#{index + 1}. #{name[:name]}"
#       end
#     }
# end

students = input_students #The outcome of the method input_students 
print_header
print(students) #Again, outcome of method input_students
print_footer(students) #Outcome of method input_students
studentindex(students)

