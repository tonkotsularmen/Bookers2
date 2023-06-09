class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books#これで、ユーザーに関連した本の投稿が取得できる。booksとなっているのはmodelにhas_many :booksと書いているから。
  end                   #@user.booksは複数の投稿が入った配列になっている。

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:update] = "You have updated user successfully."
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
