require 'rails_helper'

RSpec.describe Books::CalculateReviewsAverageService do
  let(:book) { create(:book) }

  it "Returns :insufficient_reviews if there are fewer than 3 valid reviews" do
    2.times { create(:review, book: book, stars: 5) }

    result = described_class.new(book).call
    expect(result).to eq(:insufficient_reviews)
  end

  it "Ignore reviews from banned users" do
    banned_user = create(:user, :banned)

    create(:review, book: book, stars: 5)
    create(:review, book: book, stars: 3)
    create(:review, book: book, stars: 4)
    create(:review, book: book, user: banned_user, stars: 4)

    result = described_class.new(book).call
    expect(result).to eq(4.0)
  end

  it "calculate average with one thent" do
    3.times { create(:review, book: book, stars: 5) }

    result = described_class.new(book).call
    expect(result).to eq(5.0)
  end
end
