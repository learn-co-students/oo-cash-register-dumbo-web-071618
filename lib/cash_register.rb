require 'pry'


class CashRegister
  attr_accessor :total, :discount
  attr_reader :view_cart

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @view_cart = []
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."

    end

      @total -= @total * @discount / 100
      return "After the discount, the total comes to $#{@total}."
  end

  def add_item(item, price, quantity = 1)
    cart = {}
    cart[:item] = item
    cart[:price] = price
    cart[:quantity] = quantity

    @view_cart << cart

    self.total += (price * quantity)
  end

  def items
    foods = []
    @view_cart.each do |food|
      for qty in 1..food[:quantity]
        foods << food[:item]
      end
    end
    foods
  end

  def void_last_transaction
    self.total -= (@view_cart.last[:quantity] * @view_cart.last[:price])
  end
end
