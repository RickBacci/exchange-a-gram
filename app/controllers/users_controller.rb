class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user.instagram_client.user(params[:instagram_id])
  end


end

