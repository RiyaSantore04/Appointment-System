# frozen_string_literal: true

class CounsellorsController < ApplicationController
  before_action :authentication

  def index
    @users = User.where(user_type: 'counsellor')
    render json: @users, status: 200
  end

  def create
    user = User.find(params[:counsellor_id])
    if user.user_type == 'counsellor'
      @service = Service.new(service_params)
      if @service.save
        render json: @service, status: 201
      else
        render json: { errors: @service.errors.full_messages },
               status: :unprocessable_entity
      end
    else
      render json: { errors: 'counsellor dose not exists' },
             status: :unprocessable_entity
    end
  end

  private
  def service_params
    params.require(:feedback).permit(:counsellor_id, :service_name)
  end
end
