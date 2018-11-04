class GossipTag < ApplicationRecord
	belongs_to :gossip1, optional: true
	belongs_to :tag, optional: true
end
