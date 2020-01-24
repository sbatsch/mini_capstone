class Supplier < ApplicationRecord
  has_many :products
  
  # def products
  #   Products.where(supplier_id: self.id)
  # end
end
