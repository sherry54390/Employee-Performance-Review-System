class UserController < ApplicationRecord
  has_secure_password
  def index
    @users = User.all
  end
end