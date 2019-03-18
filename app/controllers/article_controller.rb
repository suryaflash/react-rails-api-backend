class ArticleController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def index
		@article =Content.all
		render json: @article
	end

	def new
		puts "hello";
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
		@article =Content.find(params[:id])
		@article.update(title:params[:title],context:params[:context])
		render json: @article
	end

end
