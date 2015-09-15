#Type information product from keyboard
#Create a new Array contain all product
#Check valdidate for free and import product
#Display product before calculate tax
#Display product after calculate tax
#Display sum of all product and sum money of all product after calculate tax

class Product
	@@product_input = Array.new
	attr_accessor :number, :name, :cost 
	def initialize(number, name, cost)
		@number = number
		@name = name
		@cost = cost
	end
	
	def display_one_product
		print "Number: #{number}  "
		print "Name: #{name}  "
		puts "Cost: #{cost}  "
	end

	private
	def self.input_product
		puts "Input number of product"
		number = gets.to_i
		while number <= 0
			puts "Input number of product again"
			number = gets.to_i	
		end	
		puts "Input your Product: "
		name = gets.chomp
		puts "Input cost for product: "
		cost = gets.to_i
		while cost <= 0
			puts "Input cost again"
			cost = gets.to_i
		end
		
		@@product_input[@@product_input.size] = Product.new(number, name, cost) 
	end



	def self.valid_free_tax?(product)
		if (product.name.include? "medicine") || (product.name.include? "books") || (product.name.include? "food")
			return true
		else return false
		end
	end

	def self.valid_import_tax?(product)
			if (product.name.include? "import")
			return true 
			else false 
			end
	end	
	def self.sum_money_of_all_product_after_cal_tax
		sum = 0
		@@product_input.each do |product|
			if (valid_free_tax?(product) == true)
				sum += product.cost * product.number
			elsif (valid_import_tax?(product) == true)
				sum += (product.cost * 0.05 + product.cost) * product.number
			elsif (valid_free_tax?(product) == false && valid_import_tax?(product) == true)
				sum += product.cost * 0.15 + product.cost
			else
				sum += (product.cost * 0.1 + product.cost) * product.number
			end
		end
		return sum	
	end
	def self.output_after_cal_tax
		@@product_input.each do |product|
			puts "------------------------"
			print "Number: #{product.number}  "
			print "Name: #{product.name}  "
			if (valid_free_tax?(product) == true)
				puts "Cost_tax: #{product.cost}"
			elsif (valid_import_tax?(product) == true)
				product.cost += product.cost * 0.05
				puts "Cost_tax: #{product.cost}"
			elsif (valid_free_tax?(product) == false && valid_import_tax?(product) == true)
				product.cost += product.cost * 0.15
				puts "Cost_tax: #{product.cost}"
			else
				product.cost += product.cost * 0.1
				puts "Cost_tax: #{product.cost}"
			end
		end 
	end
	def self.output_before_cal_tax
		@@product_input.each do |product|
			product.display_one_product
		end
	end

	def self.sum_number_product
		sum = 0
		@@product_input.each do |product|
			sum += product.number
		end
		sum
	end
end


Product.input_product
puts "Do you want to continue: (y/n)"
choice = gets.chomp
while choice == "y"
	Product.input_product
	puts "Do you want to continue: (y/n)"
	choice = gets.chomp
end

puts "Information about product before calculated tax"
Product.output_before_cal_tax
puts "----------------------------------------------"
puts "Information about product after calculated tax"
Product.output_after_cal_tax
puts "----------------------------------------------"
puts "Total product"
p Product.sum_number_product
puts "----------------------------------------------"
puts "Total price for product"
p Product.sum_money_of_all_product_after_cal_tax

