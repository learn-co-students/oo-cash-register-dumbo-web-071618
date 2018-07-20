require 'pry'

class CashRegister
  attr_accessor :total, :discount, :all_items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @all_items = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      @all_items << {title => price}
    end
    @total += price * quantity

  end

  def apply_discount
    message = ""
    if @discount > 0
      @total -= (@total * @discount/100)
      message = "After the discount, the total comes to $#{total}."
    else
      message = "There is no discount to apply."
    end
    return message

  end

  def items
    items_list = []
    all_items.each do |item|
      item.each do |food, price|
        items_list << food
      end
    end
    items_list
  end

  def void_last_transaction
    temp_item = all_items.last
    @total -= temp_item[temp_item.keys[0]]

    all_items.pop
  end

end
