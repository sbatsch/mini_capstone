class ChangeSupplierPhoneNumber < ActiveRecord::Migration[6.0]
  def change
    change_column :suppliers, :phone_number, :string
  end
end
