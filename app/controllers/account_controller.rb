class AccountController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new]
  # before_action :set_post, only: [:show, :edit, :update, :destroy]

def index
  @users = User.all
end

def show
  @user = User.find(params[:id])
  @images = Image.all.where(user_id: @user.id)
  @musics = Music.all.where(user_id: @user.id)
  @articles = Article.all.where(user_id: @user.id)
end

private

def set_post
  @user = User.find(params[:id])
end

def account_params
  params.fetch(:post, {}).permit(:id, :term)
end

end
