require "spec_helper"
require 'jwt'

describe UsersController , :type => :api do

  let!(:error) { {:errors=>
  [{:detail=>"email is invalid", :source=>{:pointer=>"user/err_type"}},
   {:detail=>"password_confirmation can't be blank",
    :source=>{:pointer=>"user/err_type"}}]} }
  # let!(:user) { User.create(email: "sophie@email.com", password: "password") }
  
  describe "registration" do 
    it "returns a JsonAPI-friendly error object when user cannot be created" do
      post "/users", {user: {email: "sophie@email", password: "missing conf"}},:format =>:json
      expect(last_response.status).to eq(422)
      expect(last_response.body).to eq(error.to_json)
    end

    xit "making an authenticated request" do
      token = JWT.encode({user: user.id}, ENV["AUTH_SECRET"], "HS256")
      header "Authorization", "Bearer #{token}"
      get "/users", format: :json
      expect(last_response.status).to eq(200)
      expect(json).to eq({"users"=>[{"id"=>1, "first_name"=>nil, "last_name"=>nil, "email"=>"sophie@email.com"}]})
    end
  end

end  

