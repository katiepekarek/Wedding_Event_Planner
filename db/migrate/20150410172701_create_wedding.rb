class CreateWedding < ActiveRecord::Migration
  def change
    create_table :weddings do |t|
      t.string :name
    end
  end
end
