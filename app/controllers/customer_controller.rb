# frozen_string_literal: true

class CustomerController < ApplicationController
  before_action :authentication

  def create
    @appointment = Appointment.new(counsellor_id: params[:counsellor_id], customer_id: params[:customer_id],
                                   date: params[:date], time: params[:time])
    if @service.save
      render json: @service, status: :created
    else
      render json: { errors: @service.errors.full_messages },
             status: :unprocessable_entity
    end
  end
end
