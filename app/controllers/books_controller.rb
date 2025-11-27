class BooksController < ApplicationController
  def new
  end

  def index
    @user = current_user
    @books = Book.all
    @new_book = Book.new  
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id  
  
  if @new_book.save
    flash[:notice] = "successfully"
    redirect_to book_path(@new_book)
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
