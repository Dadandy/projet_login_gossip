class GossipController < ApplicationController
	
	before_action :verif_session

	def new

	end

	def index
		@user = User.includes(:gossip1s, :likes,:comments)
		@likes = Gossip1.joins(:likes)
		@user_id= session[:current_user_id]
	end
	def create
		user = User.find(session[:current_user_id])
		Gossip1.create(gossip_content:params['gossip'],user_id:user.id)
		redirect_to '/gossip'
	end

	def verif_session
		if session[:current_user_id].nil? == true then
			flash[:danger] = "Veuillez vous connecter tout d'abord"
			redirect_to '/'
		end
	end
end
