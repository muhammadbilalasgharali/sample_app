# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.first
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      # Handle a successful save.
      flash[:success] = 'Welcome to Sample App'
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
