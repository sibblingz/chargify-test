class CreateWebhooks < ActiveRecord::Migration
  def change
    create_table :webhooks do |t|

      t.string :payload
      t.string :event

      t.timestamps
    end
  end
end
