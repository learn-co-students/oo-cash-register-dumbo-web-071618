class CashRegister

attr_accessor :total, :discount, :title, :quantity, :price, :item_array, :transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @item_array = []
  end

  def add_item(title, price, quantity=1)
    @title = title
    @price = price
    @quantity = quantity

    @item_array.fill(@title, @item_array.size, @quantity)

    @total += @price * @quantity
    @transaction = @total
  end

  def apply_discount
    if @discount > 0
      discount_amount = @total * (@discount/100.00)
      @total -= discount_amount
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

   def items
     @item_array
   end

   def void_last_transaction
     @total = @total - @transaction
   end
end
