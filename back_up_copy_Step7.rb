@students = []
@cohort_month = ['january','february','march','april','may','june','july','august','september','october','november','december']

def input_students
    puts "Please enter the name, cohort, hobby and favourite food of each student."
    puts "Format: name,cohort,hobby,favourite food. To finish, just hit return twice" 
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

        if @cohort_month.include?(cohort) 
            cohort = cohort.downcase #Is this needed? 
        end 
    
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
            puts "Now we have #{@students.count} student"
        else
            puts "Now we have #{@students.count} students"
        end 
        puts "Please enter the name, cohort, hobby and favourite food of the next student."
        puts "Format: name,cohort,hobby,favourite food. To finish, just hit return twice"
        name_cohort_hobby_food = gets.chomp
    end
    puts @students #return array of hashes of the students 
end 

############ sort this out ############ sort this out ############ sort this out ############ sort this out ############ sort this out ############ sort this out
def cohort_month(students)
    cohort_each = students.each {|student|
        student[:cohort]
    }
    cohort_month = cohort_each.uniq
end 
#Print list of students
def print_header 
    puts "The students of Villans Academy"
    divider = "-------------\n"
    puts divider.center(30)
end 

############ sort this out ############ sort this out ############ sort this out ############ sort this out ############ sort this out ############ sort this out
#Iterate over the students array to print each name
def print(students, cohort_month) #names placeholder
      cohort_month.each do |cohortmonth|
        students.each_with_index do |student, index|
          if student[:cohort] == cohortmonth
            namecohort = "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
            puts namecohort.center(30)
            puts "Hobby: #{student[:hobby]},\nFave food: #{student[:food]}}"
            puts "\n"
          # puts interests.center(30)
          index += 1
      end
    end 
end

end
  


#Finally, we print the total number of students using the array.count method
def print_footer(names)  #names placeholder
    puts "Overall, we have #{names.count} great students"
end 

students = input_students #The outcome of the method input_students 
print_header
cohort_month = cohort_month(@students)
print(students, cohort_month) #Again, outcome of method input_students
print_footer(students) #Outcome of method input_students

