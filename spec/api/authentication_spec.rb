require 'rspec/rails'
require "spec_helper"

describe UsersController , :type => :api do
# describe "API authentication" , :type => :api do

  let!(:user) { User.create(email: "sophie@email.com", password: "password") }

  it "making a request without cookie token " do
    get "/users",:format =>:json
    last_response.status.should eql(401)
    error = {:error=>'unauthorized'}
    binding.pry
    expect(last_response.body).to eq(error.to_json)
  end

  it "making an authenticated request" do
  binding.pry 
    token = Knock::AuthToken.new(payload: {email: user.email, password: user.password}).token
    header "Authorization", "Bearer #{token}"
    # request.env['HTTP_AUTHORIZATION'] = "Bearer #{token}"
    get "/users", format: :json
    binding.pry
  end

end  

# class SecuredControllerTest < ActionController::TestCase
#   def authenticate
#     token = Knock::AuthToken.new(payload: {email: user.email, password: user.password}).token
#     request.env['HTTP_AUTHORIZATION'] = "Bearer #{token}"
#   end

#   setup do
#     authenticate
#   end

#   it 'responds successfully' do
#     get :index
#     assert_response :success
#   end
# end
