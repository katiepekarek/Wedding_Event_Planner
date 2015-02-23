class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :phone_number
      t.string :contact_person
      t.string :contact_email
      t.text :addtional_info

      t.timestamps null: false
    end
  end
end
