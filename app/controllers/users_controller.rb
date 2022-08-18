# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authentication

  def index
    @users = User.all
    render json: @users, status: 200
  end
end
