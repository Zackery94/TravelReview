class ChangeColumn < ActiveRecord::Migration
  def change
  	rename_column :locations, :cateogroy_id, :category_id
  end

end
