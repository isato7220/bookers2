class BooksController < ApplicationController
  def new
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new
    @book.title = params[:title]
    @book.body = params[:body]
    @book.user_id = current_user.id  
  
  if @book.save
    flash[:notice] = "successfully"
    redirect_to book_path(@book)
  else
    @user = current_user
    @books = Book.all
    flash[:alert] = "error"
    render :index 
  end
end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
        if @book.user != current_user
      redirect_to books_path
    end

  end

  def update
    @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "successfully"
    redirect_to book_path(@book)
  else
    @user = current_user
    flash[:alert] = "error"
    render :edit
  end
end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

    private 
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
