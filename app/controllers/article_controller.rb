class ArticleController < ApplicationController

	 before_action :authenticate_userdatum 
	 #skip_before_action :verify_authenticity_token...THIS IS NOT NEEDED SINCE..
	 # ..WE USE JWT AND KNOCK GEM FOR AUTHORIZATION..
	
	def index
		@article =Content.all
		render json: @article
	end

	def new
		@article = Content.new(params.permit(:title,:context))
		@article.save
		render json: @article
	end

	def delete
		Content.destroy(params[:id])
		render json: @data
	end

	def find
		@article = Content.find(params[:id])
		render json: @article
	end

	def update
		@article = Content.find(params[:id])
		@article.update(title:params[:title],context:params[:context])
		render json: @article
	end


	def signin
		@username = params[:username]
		@password = params[:password]
		@allow = false
		Userdatum.all.each do |data|
			# binding.pry
			if data.username==@username && data.password==@password
				@allow = true
				render json: {allow: "yes"} 
			end
		end
		if(@allow == false)
			render json: {allow: "no"}
		end
	end

	def signup
		@user = Userdatum.new(params.permit(:email,:password,:password_confirmation))
		if @user.save
			render json: @user
		end
	end


end
