class ApplicationController < ActionController::API
  before_action :authenticate 

  def logged_in?
    !!current_user
  end

  def current_user
    if auth_present?
      user = User.find_by(email: auth["email"])
      if user.authenticate(auth["password"])
        @current_user ||= user
      end
    end
  end

  def authenticate
    render json: {error: "unauthorized"}, status: 404 unless logged_in?
  end

  private

    def token
      request.env["HTTP_AUTHORIZATION"].split(" ").last
    end

    def auth
      Auth.decode(token)
    end

    def auth_present?
      !!request.env["HTTP_AUTHORIZATION"]
    end
end


