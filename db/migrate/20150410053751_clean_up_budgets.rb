class CleanUpBudgets < ActiveRecord::Migration
  def change
    remove_column :budgets, :vendor_name
  end
end
