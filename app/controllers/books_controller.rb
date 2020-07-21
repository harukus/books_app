class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to @book, notice: t(:create)
  end

  def update
    @book.update(book_params)
    redirect_to @book, notice: t(:update)
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: t(:destroy)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :memo, :author, :picture)
    end
end
