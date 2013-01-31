class Product < ActiveRecord::Base
  include FindingById

  belongs_to :product_family
  
  def self.sync
    products = Chargify::Product.find(:all)

    # puts products.to_yaml

    products.each do |product|
      p = Product.find_or_create_by_id(product.attributes['id'])
      p.product_family_id = product.attributes['product_family'].attributes['id']
      p.name = product.attributes['name']
      p.handle = product.attributes['handle']
      p.update_return_url = product.attributes['update_return_url']
      p.save!

      # p.update_attribute(:product_family_id, product.attributes['product_family'].attributes['id'])


      # if !p
      #   p = Product.new
      #   p.id = product.attributes['id']
      #   p.save!
      # end

      
    end

  end
end
