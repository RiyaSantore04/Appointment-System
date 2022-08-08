# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :authentication

  def index
    @users = User.where('name LIKE ? ', "%#{params[:search]}%").where(user_type: 'counsellor')
    render json: @users, status: 200
  end

  def create
    @appointment = Appointment.new(counsellor_id: params[:counsellor_id],customer_id: params[:customer_id],time: params[:time])
      if @appointment.save
        render json: @appointment, status: 201
      else
        render json: { errors: @appointment.errors.full_messages },
               status: :unprocessable_entity
      end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.present?
      @appointment.update(advise: params[:advise])
      render json: @appointment, status: 200, type: 'Success'
    else
      render json: { errors: @appointment.errors.full_messages },
      status: :unprocessable_entity 
    end
  end

  def show
    user = User.find(params[:counsellor_id])
    
  end

end
