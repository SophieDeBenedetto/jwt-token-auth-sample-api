require "spec_helper"
require 'jwt'

describe UsersController , :type => :api do

  let!(:user) { User.create(email: "sophie@email.com", password: "password") }

  it "making a request without cookie token " do
    get "/users",:format =>:json
    error = {:error=>'unauthorized'}
    expect(last_response.status).to eq(404)
    expect(last_response.body).to eq(error.to_json)
  end

  it "making an authenticated request" do
    token = JWT.encode({user: user.id}, ENV["AUTH_SECRET"], "HS256")
    header "Authorization", "Bearer #{token}"
    get "/users", format: :json
    expect(last_response.status).to eq(200)
    expect(json).to eq({"users"=>[{"id"=>1, "first_name"=>nil, "last_name"=>nil, "email"=>"sophie@email.com"}]})
  end

end  

