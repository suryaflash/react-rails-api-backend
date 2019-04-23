class ArticlesController < ApplicationController

	 before_action :authenticate_userdatum , except: :signup												
	 #skip_before_action :verify_authenticity_token...THIS IS NOT NEEDED SINCE..
	 # ..WE USE JWT AND KNOCK GEM FOR AUTHORIZATION..
		 		 

	def index
		@article = Content.all
		render json: @article
	end

	def show
		@article = Content.find(params[:id])
		render json: @article
	end

	def create
		@article = Content.new(title:params[:title],context:params[:context],edit_value:false)
		@article.save
		render json: @article
	end	

	def new
		@article = Content.new(title:params.permit(:title),context:params.permit(:context),edit_value:false)
		@article.save
		render json: @article
	end
	
	def destroy
		Content.destroy(params[:id])
		render json: @data
	end 

	def find
		@article = Content.find(params[:id])
		render json: @article
	end

	def findEdit
		c = Content.find(params[:id])	
		l = c.revisions.length
		puts "length:",l
		c= Content.find(params[:id])
		if  c.edit_value == true	
			render json: c.revisions.last(2)[0]
		else
			@article = Content.find(params[:id])
			render json: @article
		end
	end

	def latest	
		@article = Content.find(params[:id])
		render json: @article
	end

	def update
		c = Content.find(params[:id])
		c.update_attributes(title:params[:title],context:params[:context],edit_value:false)
		render json: c
	end

	def edit
		c = Content.find(params[:id])
		c.update_attributes(title:params[:title],context:params[:context],edit_value:true)
		result = c.revisions.last(2)[0]
		c.update_attributes(title: result.title,context: result.context , edit_value:true)
		result = c.revisions
		render json: result
	end


	def signin
		@username = params[:username]
		@password = params[:password]
		@allow = false
		Userdatum.all.each do |data|
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


	def history
		@history = Content.find(params[:id])
		c = @history.revisions
		render json: c
	end

end
