class DropBudgetColumns < ActiveRecord::Migration
  def change
    remove_column :budgets, :down_payment
    remove_column :budgets, :additional_payments
  end
end
