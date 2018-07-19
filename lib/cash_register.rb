require 'pry'

class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        @last_transaction = 0
        quantity.times do
            @items << title
            @last_transaction += price
        end
        self.total += price * quantity
    end

    def apply_discount
        # binding.pry
        discount = total.to_f * (@discount.to_f / 100.0)
        self.total -= discount
        if discount == 0
            "There is no discount to apply."
        else
            "After the discount, the total comes to $#{total.to_i}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end
