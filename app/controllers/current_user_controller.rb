class CurrentUserController < ApplicationController

  def show
    render json: current_user, root: "user", adapter: :json
  end
end