class UsersController < ApplicationController

  @nickname = current_user.nickname
  @tweets = current_user.tweets.page(params[:page]).per(5).order("created_at DESC")

end
