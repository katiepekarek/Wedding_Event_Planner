class AddBankWebsite < ActiveRecord::Migration
  def change
    add_column :budgets, :bank_website, :string
  end
end
