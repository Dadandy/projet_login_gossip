class UserController < ApplicationController
	before_action :verif_session
	def verif_session
		if session[:current_user_id].nil? == true then
			flash[:danger] = "Veuillez vous connecter tout d'abord"
			redirect_to '/'
		end
	end
	def show
		@user_id = session[:current_user_id]
		@user = User.find(@user_id )
	end
end
