class CreateItemcategories < ActiveRecord::Migration[7.0]
  def change
    create_table :itemcategories do |t|
      t.integer :category_id
      t.integer :item_id

      t.timestamps
    end
  end
end
