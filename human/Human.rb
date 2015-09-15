#First create one hash contain some human with properties
#Search human with age and gender
#Display human suitable with the condition above
class Human
	attr_accessor :name, :age, :gender
	@@human_array = Array.new

	def initialize(name, age, gender)
		@name = name
		@age = age
		@gender = gender
	end

	def display_one_human
		puts "Decripsion one human"
		puts "Name: #{name}"
		puts "Age: #{age}"
		puts "Gender: #{gender}"
	end
	def to_s
		"Name: #{@name}, Age: #{@age}, Gender: #{@gender}"
	end
	private
	def self.filter_human_gender(gender_human,gender)
		gender_human.select { |human|  human.to_s.include? "Male"}
	end
	def self.filter_human_greater_age(human_age)
		human_age.select {|human| human.age >= 18}
	end
	def self.filter_human_least_age(human_age)
		human_age.select {|human| human.age < 18}
	end
end


human = Array.new
human1 = Human.new("Nam", 18, "Male")
human2 = Human.new("Nga", 20, "Female")
human3 = Human.new("Nghia", 16, "Male")

human << human1
human << human2
human << human3

human_gender = Human.filter_human_gender(human,"Male")
human_age_greater_18 = Human.filter_human_greater_age(human_gender)
human_least_age_18 = Human.filter_human_least_age(human_gender)
puts human_age_greater_18
puts human_least_age_18
