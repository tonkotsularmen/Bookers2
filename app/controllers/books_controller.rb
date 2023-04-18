class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
    @books = Book.all
  end

  def show
    @book = Book.new
    @user = current_user
    @book = Book.find(params[:id])
  end

  def edit
  end

end


private

def book_params
  params.require(:book).permit(:title, :body)
end