class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = current_user
  end

  def index
    @book = Book.new
    @user = current_user
  end

  def edit
  end
end
