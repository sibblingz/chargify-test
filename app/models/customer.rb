class Customer < ActiveRecord::Base
  include FindingById

  # attr_accessible :title, :body
  has_many :subscriptions
  has_many :products, through: :subscriptions
  belongs_to :user

  def self.sync(id = :all)
    customers = Chargify::Customer.find(id)


    customers.each do |customer|
      p = Customer.find_or_create_by_id(customer.attributes['id'])
      p.email = customer.attributes['email']
      p.reference = customer.attributes['reference']
      p.save!
    end

  end


end
