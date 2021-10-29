class UserController < ApplicationRecord
  def index
    @users = User.all
  end
end