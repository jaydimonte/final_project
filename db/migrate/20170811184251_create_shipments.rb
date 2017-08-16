class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.integer :order_id
      t.integer :cycle_id
      t.integer :address_id
      t.integer :user_id

      t.timestamps

    end
  end
end
