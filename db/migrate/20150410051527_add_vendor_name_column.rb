class AddVendorNameColumn < ActiveRecord::Migration
  def change
    remove_column :budgets, :vendor_id
  end
end
