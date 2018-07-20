
class CashRegister
  attr_accessor :title, :price, :quantity, :discount
  attr_reader :password

 # Set the default value for discount.
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @all = []
    @all_transactions_amounts = []
  end

  # def discount
  #   @discount
  # end

  def add_item(title, price, quantity = 1)
    @all_transactions_amounts << (price * quantity)

    quantity.times do
      @all << title
    end
    #
    # @@all << title * quantity
  end

  def apply_discount
    if discount > 0
      self.total -= 200
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @all
  end

  def total= (amount)
    @all_transactions_amounts = [amount]
  end

  def total
    new_total = 0
    @all_transactions_amounts.each do |amount|
      new_total += amount
    end
    return @total = new_total
  end

  def void_last_transaction
    @all_transactions_amounts.pop
  end

end
