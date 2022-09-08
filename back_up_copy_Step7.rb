@students = []


def input_students
    puts "Please enter the names of the students. To finish, just hit return twice" 
    name = gets.chomp #So 'name' will be empty, and while loop breaks 
    
    while !name.empty? do 
        #New hash pushed to students array
        #key => :value 
        @students << {name: => name, cohort: => cohort.to_sym, hobby: => hobby, favefood: => favefood} 
        puts "Now we have #{@students.count} students"
        name = gets.chomp
    end
    @students #return array of hashes of the students 
end 

#Print list of students
def print_header 
    puts "The students of Villans Academy"
    divider = "-------------\n"
    puts divider.center(30)
end 

#Iterate over the students array to print each name
def print(students) #names placeholder
    index = 0
    while index < @students.length
      students.each do |student|
        namecohort = "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
        puts namecohort.center(30)
        puts "Hobby: #{student[:hobby]},\nFave food: #{student[:favefood]}}"
        puts "\n"
        # puts interests.center(30)
        index += 1
      end
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
