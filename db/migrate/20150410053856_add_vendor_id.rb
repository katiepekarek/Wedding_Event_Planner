class AddVendorId < ActiveRecord::Migration
  def change
    add_column :budgets, :vendor_id, :integer
  end
end
