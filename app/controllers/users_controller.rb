class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
end
