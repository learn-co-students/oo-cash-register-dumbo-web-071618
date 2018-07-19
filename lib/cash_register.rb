require 'pry'

class CashRegister 

	attr_reader :discount
	attr_accessor :total, :items

	def initialize(discount=0.00)
		@total = 0.00
		@discount = discount
		@items = []
		@last = 0.00
	end

	def apply_discount
		total += total* (discount/100)
		"The total is #{total}"
	end

	def add_item(title,price,quantity=1)
		quantity.times {@items << title}
		self.total += price*quantity
		@last = price*quantity
	end

	def apply_discount 
		if self.discount != 0
			self.total -= self.total * (self.discount.to_f/100.00)
			return "After the discount, the total comes to $#{total.round}."
		else 
			return "There is no discount to apply."
		end

	end


	def items 
		@items
	end

	def void_last_transaction
		@items.pop
		@total -= @last
	end
end

jim = CashRegister.new(20)


jim.add_item "eggs",5.00,3
jim.add_item 'bread',5.00,2
jim.add_item 'milk',3
puts jim.total

puts jim.apply_discount
puts jim.total