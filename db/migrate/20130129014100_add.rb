class Add < ActiveRecord::Migration
  def change
    add_column :products, :product_family_id, :integer
    add_column :products, :name, :string
    add_column :products, :handle, :string
    add_column :products, :update_return_url, :string

    add_column :product_families, :name, :string
  end
end
