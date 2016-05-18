class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:create]
  
  def create
    binding.pry
  end
end