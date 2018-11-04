class CreateGossipTags < ActiveRecord::Migration[5.2]
  def change
    create_table :gossip_tags do |t|
    	t.belongs_to :gossip1, index: true
    	t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
