
class CashRegister
  

    attr_accessor :total, :discount
    
    def  initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
    
    end 

    


    def add_item(title, price, quantity=0)
        items_hash = {}
        items_hash[:title] = title
        items_hash[:price] = price 
        items_hash[:quantity] = quantity
        

        items_hash[:quantity] > 0 ? @total += items_hash[:price] * items_hash[:quantity] : @total += items_hash[:price] 


        #puts total #items_hash

        @cart << items_hash

    end 

    def total 
     @total
    end 

    def  apply_discount
     if @discount == 0
      return "There is no discount to apply."
     end 
     
    @total -= @discount * @total /100
     return "After the discount, the total comes to $#{@total}."
    end


    def items
        arr = []
        @cart.each do |h|
            if h[:quantity] == 0
           arr <<  h[:title]
            else
                h[:quantity].times do 
                arr << h[:title]
                end 
            end 
        end  
        
     arr
    
    end

 def void_last_transaction
    ans = @cart.pop
   @total -=  ans[:price]
   


 end





end 
