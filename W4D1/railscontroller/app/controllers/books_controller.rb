class BooksController < ApplicationController
  def index
    @books =  Book.all
    render :index
  end

  def new
    render :new
  end

  def create
    # your code here
    Book.create!(book_params)
    redirect_to books_url
  end

  def destroy
    book_id = params[:id]
    Book.delete(book_id)
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
