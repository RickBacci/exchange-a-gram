class UsersController < ApplicationController
  def index
    # @user = current_user.instagram_client.user(params[:instagram_id]) if current_user
    # if params['name']
    #   @search_user = current_user.instagram_client.user_search(params['name']).first.id
    #   if @search_user
    #     redirect_to user_path(@search_user)
    #   else
    #     render :root
    #   end
    # end
  end

  def show
#    @user = current_user.instagram_client.user(params[:instagram_id])
  end
end

