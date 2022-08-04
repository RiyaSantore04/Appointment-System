class CounsellorsController < ApplicationController
  before_action :authentication

    def index
      @users = User.where(user_type: 'counsellor')
      render json: @users, status: :ok
    end

    def create
      user = User.find(params[:counsellor_id]) 
      if user.user_type == 'counsellor' 
         @service = Service.new(counsellor_id: params[:counsellor_id], service_name: params[:service_name])
         if @service.save
            render json:  @service, status: :created
         else
            render json: {errors: @service.errors.full_messages},
            status: :unprocessable_entity
         end
      else
         render json: {errors: "counsellor dose not exists"}
         status: :unprocessable_entity
      end
    end
end
