class UsersController < ApplicationController
    # before_action :authenticate_user, only: :show

  def show
    user = User.find params[:id]
    render json: user, status: 201
  end

  def create
    user = User.new(user_params)
    puts user.valid?
    puts user.errors.messages

    if user.save
     token = Knock::AuthToken.new(payload: { sub: user.id }).token
     payload = {
         user: user,
         jwt: token
      }
      render json: user, status: 201
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :avatar_base)
  end
end
