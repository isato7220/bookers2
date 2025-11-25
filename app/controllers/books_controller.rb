class BooksController < ApplicationController
  def new
  end

  def index
    @user = current_user
    @books = Book.all
  end

  def show
  end

  def edit
  end
end
