class UserdatumTokenController < Knock::AuthTokenController
	def index
		render json: {message:"hi"}
	end
end
