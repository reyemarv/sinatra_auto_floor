class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.string :color 
      t.string :amount
      t.integer :user_id
      t.timestamps
    end 
  end
end
