class Comment < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :gossip1, optional: true
end
