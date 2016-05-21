class UsersController < ApplicationController

  def index
    render json: {users: User.all}
  end

  def show
    render json: User.find_by(params[:id])
  end


end
