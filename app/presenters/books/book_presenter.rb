module Books
  class BookPresenter
    def initialize(book)
      @book = book
    end

    def title
      @book.title.capitalize
    end

    def average_reviews_label
      average = CalculateReviewsAverageService.new(@book).call

      return "Reseñas Insuficientes" if average == :insufficient_reviews

      "Promedio: #{average}"
    end

    def reviews
      @book.reviews
    end
  end
end
