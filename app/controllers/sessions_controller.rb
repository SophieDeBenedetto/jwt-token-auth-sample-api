class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:create]
  
  def create
    user = User.find_by(email: auth_params[:email])
    if user && user.authenticate(auth_params[:password])
      jwt = Auth.issue({user: user.id})
      render json: {jwt: jwt}
    else
      render json: {:errors=>
        [{:detail=>"incorrect email or password", 
          :source=>{:pointer=>"user/err_type"}}
        ]}, status: 404
    end
  end

  private
    def auth_params
      params.require(:auth).permit(:email, :password)
    end
end