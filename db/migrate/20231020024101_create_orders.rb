class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :total_price
      t.integer :shipping_fee
      t.integer :payment_method
      t.string :postal_code
      t.string :shipping_address
      t.string :name
      t.string :transaction_status

      t.timestamps
    end
  end
end
