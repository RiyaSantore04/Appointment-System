# frozen_string_literal: true
class CustomersController < ApplicationController
  before_action :authentication

  def index
    @users = User.where('name LIKE ? ', "%#{params[:search]}%").where(user_type: 'counsellor')
    render json: @users, status: 200
  end

  def create
    @appointment = Appointment.new(appointment_params)
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
    user = User.find(params[:id])
    appointment = user.appointments.all.pluck(:time).map{|appointment| appointment.strftime('%I:%M')}
    from = "11:00".to_time.strftime('%I:%M')
    to = "20:00".to_time.strftime('%I:%M') 
    time = [from]
    loop do
      break if time.last == to
      time << (time.last.to_time + 3600).strftime('%I:%M')
    end
    available_time = time - appointment
    render json: available_time, status: 200
  end

  private

  def appointment_params
    params.require(:appointment).permit(:counsellor_id, :customer_id, :time)  
  end
end
