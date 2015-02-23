class Add < ActiveRecord::Migration
  
  def up
    remove_column :vendors, :addtional_info
  end

  def down
    add_column :vendors, :additional_info, :text
  end

end
