class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
    flash[:success] = "You have created book successfully."
  end

  def index
    @book = Book.new #部分テンプレート用
    @user = current_user #部分テンプレート用
    @books = Book.all #一覧を表示させるためのもの
  end

  def show
    @new = Book.new  #部分テンプレート用
    @book = Book.find(params[:id])#これはほぼ決まった形なので変えない
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    flash[:updated] = "You have updaeted book successfully."
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


