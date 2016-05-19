class ApplicationController < ActionController::API
  include ActionController::Serialization
  include Knock::Authenticable
  before_action :authenticate 

 
end


