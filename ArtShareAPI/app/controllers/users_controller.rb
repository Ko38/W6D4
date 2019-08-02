class UsersController < ApplicationController
  def index
    name = params[:name]

    if name.nil?
      users = User.all
    else
      users = User.where("username LIKE '%#{name}%'")
    end

    render json: (users.empty? ? "No user found!" : users)
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
    begin
      user = User.find(params[:id])
      user.destroy
      render json: "Removed!"
    rescue
      render json: "User doesn't exist", status: 422
    end
  end


  private

  def user_params
    params.require(:user).permit(:username)
  end
  
end
