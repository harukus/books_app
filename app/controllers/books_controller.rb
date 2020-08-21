class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    user = User.find(current_user.id)
    follow_users = user.following_user.ids.push(current_user.id)
    @books = Book.where(user_id: follow_users).page(params[:page])
  end

  def show
    user = User.find_by(id: @book.user_id)
  end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book, notice: t(:create)
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: t(:update)
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      redirect_to books_url, notice: t(:destroy)
    else
      render :show
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :memo, :author)
  end
end
