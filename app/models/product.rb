class Product < ApplicationRecord
  def is_discounted?
    if self.price > 10000
      return false 
    else 
      return true
    end 
  end 

  def tax
    return self.price * 0.09 
  end 

  def total
    return self.price + self.tax
  end

end