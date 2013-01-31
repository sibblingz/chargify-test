class Subscription < ActiveRecord::Base
  include FindingById
  # attr_accessible :title, :body

  belongs_to :customer
  belongs_to :product
  # has_one :product_family, through: :product

  def self.sync(id = :all)
    subscriptions = Chargify::Subscription.find(id)

    toReturn = Array.new

    [*subscriptions].each do |subscription|
      p = Subscription.find_or_create_by_id(subscription.attributes['id'])
      p.state = subscription.attributes['state']
      p.product_id = subscription.attributes['product'].id
      p.customer_id = subscription.customer.attributes['id']
      p.save!
      toReturn << p
    end

    return toReturn

  end

  def migrate(to_product_id)
    Chargify::Subscription.find(self.id).migrate(:product_id => to_product_id, :include_trial => false)
    return self
  end

  def cancel
    res = Chargify::Subscription.find(self.id).cancel
    # self.update(res.body)

    puts "---------: " + res.body.to_json

    return self
  end

  def reactivate
    Chargify::Subscription.find(self.id).reactivate
    return self
  end

end
