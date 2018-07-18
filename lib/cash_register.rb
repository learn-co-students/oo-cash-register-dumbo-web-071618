require 'pry'

class CashRegister

attr_accessor :total, :discount, :transaction

def initialize(discount=0)
  @total = 0
  @discount = discount
  @items_array = []
end

def add_item(title, price, quantity=0)

  if quantity > 0
    @total = @total +(price * quantity)
    @transaction = price * quantity
  else  @total += price
        @items_array << title
        @transaction = price
  end

  while (quantity > 0)
    @items_array << title
    quantity -= 1
  end
end

def apply_discount
  if @discount == 0
    "There is no discount to apply."
  else
    @total =  @total - (@total * ((@discount) * 0.01) )
    "After the discount, the total comes to $#{@total.to_i}."
  end
end

def items
@items_array
end

def void_last_transaction
  @total -= @transaction
end

end
