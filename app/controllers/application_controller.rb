class ApplicationController < ActionController::API
  include Knock::Authenticable
  before_action :authenticate
end
