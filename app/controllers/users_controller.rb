class UsersController < ApplicationController
  def index
     @client ||= Instagram.client(:access_token => current_user.token)
  end

  def show
     @client ||= Instagram.client(:access_token => current_user.token)
  end
end

