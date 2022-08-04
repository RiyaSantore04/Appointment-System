class UsersController < ApplicationController
   before_action :authentication

	def index
		if params[:search].blank?
			@users = User.all
			render json: @users, status: :ok
		else
			@users = User.where('name LIKE ? ', "%#{params[:search]}%").where(user_type: 'counsellor')
			render json: @users, status: :ok
		end
	end
end
