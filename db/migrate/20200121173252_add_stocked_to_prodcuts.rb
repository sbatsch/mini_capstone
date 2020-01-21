class AddStockedToProdcuts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :stocked, :boolean, default: true 
  end
end
