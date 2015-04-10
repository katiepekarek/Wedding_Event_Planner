class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :location
      t.time :start_time
      t.text :notes
      t.integer :wedding_id
      t.integer :vendor_id
      t.date :date
    end
  end
end
