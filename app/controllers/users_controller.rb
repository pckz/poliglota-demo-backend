class UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all).serialized_json
  end

  def create
    user = User.new(user_params)
    location = Location.find_or_create_by(location_params)
    user.location = location
    
    if user.save
      render json: UserSerializer.new(user).serialized_json, status: :ok
    else
      render json: user.errors
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def location_params
    params.require(:location).permit(:name)
  end
end
