class RenameColumn < ActiveRecord::Migration
  def self.up
    rename_column :categories, :name, :names
  end

end
