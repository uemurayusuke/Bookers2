class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end



  def show
    @book = Book.find(params[:id])
    @books = current_user.books
    @bookss = Book.new
  end

  def edit
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end



end