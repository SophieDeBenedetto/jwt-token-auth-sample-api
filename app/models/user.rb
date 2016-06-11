class User < ApplicationRecord
  has_secure_password
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :password, confirmation: true 
  validates :password_confirmation, presence: true

  def generate_json_api_error
    json_error = {"errors": []}
    errors.messages.each do |err_type, messages|
      messages.each do |msg|
        json_error[:errors] << {"detail": "#{err_type} #{msg}", "source": {"pointer": "user/err_type"}}
      end
    end
    json_error
  end
end
