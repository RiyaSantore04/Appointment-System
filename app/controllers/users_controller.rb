# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authentication

  def index
    @users = if params[:search].blank?
               User.all
             else
               User.where('name LIKE ? ', "%#{params[:search]}%").where(user_type: 'counsellor')
             end
    render json: @users, status: :ok
  end
end
