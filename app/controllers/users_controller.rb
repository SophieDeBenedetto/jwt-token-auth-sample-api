class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create]
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      head :ok
    else
      errors = user.generate_json_api_error
      render json: errors, status: 422
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end


end

