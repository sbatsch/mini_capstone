class Product < ApplicationRecord
  belongs_to :supplier

  # def supplier
  #   Supplier.find_by(id: self.supplier_id)   
  # end

  validates :name, presence: true 
  validates :name, uniqueness: true 
  validates :name, length: { maximum: 255 }
  validates :price, presence: true
  validates :price, numericality: true
  validates :price, numericality: { greater_than: 0, less_than: 10_000 }
  validates :description, length: { in: 10..500 }
  validates :image_url, length: { maximum: 255 }

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