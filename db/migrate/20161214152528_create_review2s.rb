class CreateReview2s < ActiveRecord::Migration
  def change
    create_table :review2s do |t|
      t.text :content
      t.integer :user_id
      t.integer :location_id
      t.integer :stars

      t.timestamps null: false
    end
  end
end
