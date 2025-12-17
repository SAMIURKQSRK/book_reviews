require "rails_helper"

RSpec.describe Books::BookPresenter do
  let(:book) { create(:book, title: "book presenter") }

  describe "#title" do
    it "returns the formatted and capitalized title" do
      presenter = described_class.new(book)
      expect(presenter.title).to eq("Book presenter")
    end
  end

  describe "#average_reviews_label" do
    it "displays 'Reseñas Insuficientes' if there are not enough reviews" do
      result = described_class.new(book)
      expect(result.average_reviews_label).to eq("Reseñas Insuficientes")
    end

    it "show the formatted average" do
      3.times { create(:review, book: book, stars: 4) }

      result = described_class.new(book)
      expect(result.average_reviews_label).to eq("Promedio: 4.0")
    end
  end
end
