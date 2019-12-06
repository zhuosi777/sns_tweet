class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
    redirect_to root_path
    else
      render 'new'
  end
end

  def destroy
    @tweet.destroy if @tweet.user_id == current_user.id
  end

  def edit
    if user_signed_in? && current_user.id == @tweet.user_id
      @tweet = Tweet.find(params[:id])
    else user_signed_in?
      redirect_to(root_path)
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.user_id == current_user.id
      @tweet.update(tweet_params)
  end
end

  def show
    @comments = @tweet.comments.includes(:user)
  end

  private
  def tweet_params
    params.permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
