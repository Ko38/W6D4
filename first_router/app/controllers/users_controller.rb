class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

   def show
    begin
      user = User.find(params[:id])
      render json: user
    rescue
      render json: "User doesn't exist", status: 422
    end
  end

  def update
    begin
      # user = User.update(user_params)
      user = User.update(params[:id], user_params)
      render json: user
    rescue
      render json: "User doesn't exist", status: 422
    end
  end

  def destroy
    if User.delete(params[:id]) == 1
      render json: "Removed!"
    else
      render json: "User doesn't exist", status: 422
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
