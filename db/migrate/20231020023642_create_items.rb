class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name, null: false
      t.string :description, null: false
      t.integer :price, null: false
      t.integer :discount
      t.boolean :is_on_sale, null: false, default: true

      t.timestamps
    end
  end
end
