class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create]
  def index
    render json: User.all
  end

  def show
    render json: User.find_by(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      head :ok
    else
      render json: user.errors
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end


end
