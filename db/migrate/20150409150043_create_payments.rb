class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :budget_id
      t.integer :amount
      t.date :due_date
    end
  end
end
