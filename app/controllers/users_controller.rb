require 'digest'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user.to_json(include: :messages)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, notice: "User was successfully created."
    else
      render json: "Error creating"
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: "Error updating"
    end
  end

  def destroy
    @user.messages.destroy_all

    @user.destroy
    render json: "User was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params2 = params.require(:user).permit(:user_name, :email, :password)
    if params2[:password]
      params2[:password] = Digest::MD5.hexdigest params2[:password]
    end
    params2
  end
end
