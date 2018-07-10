class UsersController < ApplicationController
  def index
    render json: User.all
  end
  #
  # def create
  #   render json: params
  # end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(params.require(:user).permit(:name))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: params
  end

  def user_params
    return {} if params[:user].nil?
    params.require(:user).permit(:name)

  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: User.all
  end
end
