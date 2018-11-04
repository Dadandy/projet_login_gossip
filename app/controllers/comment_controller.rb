class CommentController < ApplicationController
	before_action :verif_session

	def like
		like = Like.where(['gossip1_id = ?',params['id'].to_i])	
		like.each do |like|
				if like.user_id == session[:current_user_id] then
					@exist = true
			end
		end

		if @exist then
			puts 'efa nanao j\'aime'
		else
			puts 'vao ampidirina'
			Like.create(gossip1_id: params['id'].to_i, user_id: session[:current_user_id])
			puts 'izay fa tafiditra'
		end

		if like.count == 0 then
			Like.create(gossip1_id: params['id'].to_i, user_id: session[:current_user_id])
		end
	
		redirect_to '/gossip'
	end

	def comment
		@gossip = Gossip1.includes(:comments,:user).where('id' => params['id'])

	end

	def add_comment
		Comment.create(comment_content: params[:comment],user_id:session[:current_user_id],gossip1_id:params[:id])
		redirect_to '/gossip'
	end

	def verif_session
		if session[:current_user_id].nil? == true then
			flash[:danger] = "Veuillez vous connecter tout d'abord"
			redirect_to '/'
		end
	end
end
