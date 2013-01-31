class Webhook < ActiveRecord::Base
  # attr_accessible :title, :body

  def self.log(params)

    puts "Self.create params: #{params.inspect}"

    webhook = Webhook.new
    webhook.id = params["id"].to_i
    webhook.payload = params["payload"]
    webhook.event = params["event"]

    puts webhook.inspect

    return webhook.save!
  end

end
