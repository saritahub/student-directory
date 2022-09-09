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
@cohort_month = ['january','september','october'] #Now cohort month can only be January, September or December
@existing_cohorts = []

def input_students
    puts "Please enter the name, cohort, hobby and favourite food of each student.\n"
    puts "Cohort months: January, September or October.\n"
    puts "Format: name,cohort,hobby,favourite food. To finish, just hit return twice.\n" 
    name_cohort_hobby_food = gets.chomp 
    
    while !name_cohort_hobby_food.empty? do 
        #Ensure the user input contains two commas. This is to separate the values
        while name_cohort_hobby_food.count(",") != 3
            puts "ERROR: Please enter the correct format (name,cohort,hobby,favourite food)"
            name_cohort_hobby_food = gets.chomp
        end 
        #Split the input into separate variables
        #First convert variable to an array
        input_array = name_cohort_hobby_food.split(",")
        #Name is first, capitalize first and surname
        name = input_array[0].split(/ |\_/).map(&:capitalize).join(" ")
        
        #cohort second. If no input, add the current month as the cohort
        #COHORT
        cohort = input_array[1]

        # if @cohort_month.include?(cohort) 
        #     cohort = cohort.downcase #Is this needed? 
        # end 
    
        while !@cohort_month.include?(cohort) 
            month = Time.new 
            current_month = month.strftime("%B").downcase
            cohort = current_month.downcase 
        end 

        #HOBBY
        hobby = input_array[2]

        #Food
        food = input_array[3]
        
        #New hash pushed to students array
        #key => :value 
        @students << {name: name, cohort: cohort, hobby: hobby, food: food} 
        if @students.count == 1
            puts "Now we have #{@students.count} student\n"
        else
            puts "Now we have #{@students.count} students\n"
        end 
        puts "\nPlease enter the name, cohort, hobby and favourite food of the next student.\n"
        puts "Cohort months: January, September or October.\n"
        puts "Format: name,cohort,hobby,favourite food. To finish, just hit return twice.\n"
        name_cohort_hobby_food = gets.chomp
    end
    @students #return array of hashes of the students 
end 

def cohort_month(students)
    cohort_each = students.map {|student|
        student[:cohort]
    }
    cohort_month = cohort_each.uniq   #List of existing cohorts 
    @existing_cohorts = cohort_month #Add all existung cohorts to the existing cohort array 
end 

#Print list of students
def print_header 
    puts "The students of Villans Academy"
    divider = "-------------\n"
    puts divider.center(30)
end 


#Iterate over the students array to print each name
def print 
    @existing_cohorts = @students.map {|student| student[:cohort]}.sort.uniq
    index = 0
    @students.each { |student|
      if student[:cohort] == @existing_cohorts[0]
        namecohort = "#{student[:name]} (#{student[:cohort].capitalize} cohort)"
            puts namecohort.center(30)
            puts "Hobby: #{student[:hobby]},\nFave food: #{student[:food]}"
            puts "\n"
         end 
         index += 1
    }

    @students.each {|student|
        if student[:cohort] == @existing_cohorts[1]
            namecohort =  "#{student[:name]} (#{student[:cohort].capitalize} cohort)"
                puts namecohort.center(30)
                puts "Hobby: #{student[:hobby]},\nFave food: #{student[:food]}"
                puts "\n"
             end 
             index += 1
    }

    @students.each {|student|
        if student[:cohort] == @existing_cohorts[2]
            namecohort = "#{student[:name]} (#{student[:cohort].capitalize} cohort)"
                puts namecohort.center(30)
                puts "Hobby: #{student[:hobby]},\nFave food: #{student[:food]}"
                puts "\n"
             end 
             index += 1
    }
end



#Finally, we print the total number of students using the array.count method
def print_footer(names)  #names placeholder
    puts "Overall, we have #{names.count} great students"
end 

students = input_students #The outcome of the method input_students 
print_header
cohort_month = cohort_month(@students)
print #(students, cohort_month) #Again, outcome of method input_students
print_footer(students) #Outcome of method input_students


