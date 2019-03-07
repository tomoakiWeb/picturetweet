class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end

  def search
    @users = User.where('nickname LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end

end
