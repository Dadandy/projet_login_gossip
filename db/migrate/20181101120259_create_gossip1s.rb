class CreateGossip1s < ActiveRecord::Migration[5.2]
  def change
    create_table :gossip1s do |t|
    	t.text :gossip_content
		t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
