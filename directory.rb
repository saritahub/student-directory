@students = []
@cohort_month = ['january','september','october'] #Now cohort month can only be January, September or December
@existing_cohorts = []
@name_cohort_hobby_food = " "

#Step 9: Adding interactive menu
def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the students from students.csv"
    puts "9. Exit"
end 

def interactive_menu
    loop do
    print_menu
    process(STDIN.gets.chomp)
    end 
end 

def process(selection)
    case selection
    when "1"
      puts "\nThanks for selecting option 1, you can input students now."
      input_students
    when "2"
      puts "\nThanks for selecting option 2, here is the students list:"
      show_students
    when "3"
      puts "\nThanks for selecting option 3, the student's list is saved."
      save_students
    when "4"
      puts "\nThanks for selecting option 4, loading the student's list"
      load_students
    when "9"
      puts "\n Bye!"
      exit
    else  
      puts "I don't know what you mean, try again" 
    end 
end 

def input_students
    puts "\nPlease enter the name, cohort, hobby and favourite food of each student.\n"
    puts "Cohort months: January, September or October.\n"
    puts "Format: name,cohort,hobby,favourite food. To finish, just hit return twice.\n" 
    @name_cohort_hobby_food = STDIN.gets.strip 
    if @name_cohort_hobby_food.empty?
        puts "BLANK INPUT: Please enter at least one student cohort, hobby and favourite food of each student.\n"
        puts "Cohort months: January, September or October.\n"
        puts "Format: name,cohort,hobby,favourite food. To finish, just hit return twice.\n" 
        @name_cohort_hobby_food = STDIN.gets.strip 
    end  
    while !@name_cohort_hobby_food.empty? do 
        #Ensure the user input contains two commas. This is to separate the values
        while @name_cohort_hobby_food.count(",") != 3
            puts "ERROR: Please enter the correct format (name,cohort,hobby,favourite food)"
            @name_cohort_hobby_food = STDIN.gets.strip
        end 
        #Split the input into separate variables
        #First convert variable to an array
        input_array = @name_cohort_hobby_food.split(",")
        #Name is first, capitalize first and surname
        name = input_array[0].split(/ |\_/).map(&:capitalize).join(" ")
        
        #cohort second. If no input, add the current month as the cohort
        #COHORT
        cohort = input_array[1]
    
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
        @name_cohort_hobby_food = STDIN.gets.strip
    end
    @students #return array of hashes of the students 
end 
 

def show_students
    print_header
    cohort_month = cohort_month(@students)
    print_students_list #(students, cohort_month) #Again, outcome of method input_students
    print_footer(@students) #Outcome of method input_students
end 

#Print list of students
def print_header 
    if !@name_cohort_hobby_food.empty?
      puts "The students of Villanelle's Academy"
      divider = "-------------\n"
      puts divider.center(30)
    end 
end 

#Iterate over the students array to print each name
def print_students_list  
    @existing_cohorts = @students.map {|student| student[:cohort]}.sort.uniq
    index = 0
    @students.each { |student|
      if student[:cohort] == @existing_cohorts[0]
        namecohort = "#{student[:name]} (#{student[:cohort].capitalize} cohort)"
            puts "\n"
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
    if @students.count == 1
        puts "Overall, we have 1 great student"
    elsif @students.count > 1 
      puts "Overall, we have #{names.count} great students"
    else 
        puts "No student information yet"
    end 
end

def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end 
    file.close 
end 

def load_students(filename = "students.csv") #Sets the default filename
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
end

def try_load_students
    filename = ARGV.first 
    return if filename.nil? 
    if File.exist?(filename) 
      load_students(filename)
       puts "Loaded #{@students.count} from #{filename}"
    else 
      puts "Sorry, #{filename} doesn't exist."
      exit 
    end
end

def cohort_month(students)
    cohort_each = students.map {|student|
        student[:cohort]
    }
    cohort_month = cohort_each.uniq   #List of existing cohorts 
    @existing_cohorts = cohort_month #Add all existung cohorts to the existing cohort array 
end 


try_load_students
interactive_menu
students = input_students #The outcome of the method input_students 
print_header
cohort_month = cohort_month(@students)
print #(students, cohort_month) #Again, outcome of method input_students
print_footer(@students) #Outcome of method input_students

