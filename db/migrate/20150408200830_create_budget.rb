class CreateBudget < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :vendor_id
      t.integer :total_due
      t.integer :down_payment
      t.integer :additional_payments
    end
  end
end
