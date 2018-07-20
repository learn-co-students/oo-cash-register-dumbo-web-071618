require 'pry'
class CashRegister
    
    attr_accessor :total, :discount, :items, :transactions

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @transactions = []
    end

    def add_item(item, price, qty=1)
        qty.times {@items << item}
        @total += price * qty
        @transactions << price * qty
    end

    def apply_discount
        if @discount > 0
            @total -= @discount / 100.0 * @total
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @transactions[-1]
    end
end