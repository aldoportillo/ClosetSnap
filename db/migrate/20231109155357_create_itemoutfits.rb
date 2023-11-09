class CreateItemoutfits < ActiveRecord::Migration[7.0]
  def change
    create_table :itemoutfits do |t|
      t.integer :item_id
      t.integer :outfit_id

      t.timestamps
    end
  end
end
