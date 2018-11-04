class RegistrationController < ApplicationController

	def show
		reset_session
		redirect_to '/'
	end
	def login

	end
	def new

	end
	def create
		if params['password'] == params['password_confirm'] && params['password'] != "" && params['first_name'] != ""  then
			User.create(first_name:params['first_name'],password:params['password'])
			flash[:success] = "Veuillez vous connectez désormés"
			redirect_to '/'
		else
			flash[:danger] = "Les deux mot de passe ne correspondent pas ou username invalide"
			redirect_to '/registration/new'
		end
		
	end

	def verif
		user = User.find_by_first_name(params['first_name'])
		if user.nil? != true then
			if  user.password == params['password'] then
				session[:current_user_id] = user.id
				redirect_to "/gossip"
			else
				flash[:danger] = "Identification incorrect"
				redirect_to '/'
			end 
		else
			flash[:danger] = "Identification incorrect"
			redirect_to '/'
		end
	end
	
end
