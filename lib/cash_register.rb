class CashRegister
attr_accessor :total, :items, :discount


  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item,price,quantity=1)
    @total += price*quantity
    quantity.times do @items << [item,price,quantity] end
  end

  def apply_discount
    if !@discount.nil?
      @total*=0.8
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items.map{|array| array[0]}
  end

  def void_last_transaction
    @total -= (@items.last[1] * @items.last[2])
  end

end
