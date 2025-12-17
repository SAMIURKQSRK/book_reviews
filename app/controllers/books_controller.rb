class BooksController < ApplicationController
  def index
    @books = Book.includes(reviews: :user).map { |book| Books::BookPresenter.new(book) }
  end

  def show
    book = Book.includes(reviews: :user).find(params[:id])
    @book = Books::BookPresenter.new(book)
  end
end
