module Books
  class CalculateReviewsAverageService
    MIN_REVIEWS = 3.freeze

    def initialize(book)
      @book = book
    end

    def call
      valid = @book.reviews.select(&:valid_for_average?)

      return :insufficient_reviews if valid.size < MIN_REVIEWS

      average = valid.map(&:stars).sum.to_f / valid.size
      average.round(1)
    end
  end
end
