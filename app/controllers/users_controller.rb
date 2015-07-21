class UsersController < ApplicationController
  def index
  end

  def show
     @client = Instagram.client(:access_token => current_user.token)
  end
end

