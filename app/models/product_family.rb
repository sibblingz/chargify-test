class ProductFamily < ActiveRecord::Base
  include FindingById

  has_many :products 

  def self.sync
    product_families = Chargify::ProductFamily.find(:all)

    # puts product_families.to_yaml

    product_families.each do |family|
      p = ProductFamily.find_or_create_by_id(family.attributes['id'])
      p.name = family.attributes['name']
      p.save!
    end

  end
end
