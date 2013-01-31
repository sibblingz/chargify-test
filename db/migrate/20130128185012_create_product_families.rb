class CreateProductFamilies < ActiveRecord::Migration
  def change
    create_table :product_families do |t|

      t.timestamps
    end
  end
end
