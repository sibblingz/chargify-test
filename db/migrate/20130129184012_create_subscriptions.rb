class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|

      t.string :state
      t.integer :product_id
      t.integer :customer_id

      t.timestamps
    end

    add_column :products, :subscription_id, :integer
  end
end
