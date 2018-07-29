class CashRegister
  attr_accessor :total, :discount, :items, :item_prices

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @item_prices = []
  end

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
      quantity.times do
      @items << title
    end
    @item_prices << quantity * price
  end

  def apply_discount
    if discount > 0
     self.total -= self.total * @discount / 100
      # final_price = self.total - discounted
      return "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= @item_prices[-1]
  end
end
