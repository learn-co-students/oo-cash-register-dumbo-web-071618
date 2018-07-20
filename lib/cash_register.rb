#create a class of class Register

class CashRegister

  attr_accessor :total, :discount, :items, :item_prices

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @item_prices = []
  end

#new method of instance add_method will take in title and price
#and increase the total which is already 0
#so add onto @total

  def add_item(title, price, new_quantity = 1)
    @total += price * new_quantity
    @total
    new_quantity.times do
      @items << title
    end
      #do something x times by using new_quantity
      @item_prices << new_quantity*price
  end

  #calling our total price now we will add our discount to this
  def apply_discount
    if @discount > 0
      @total -= @total * @discount/100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @item_prices[-1]
  end

end
