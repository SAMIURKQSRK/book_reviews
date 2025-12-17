require "rails_helper"

RSpec.describe Review, type: :model do
  let(:user) { create(:user) }
  let(:book) { create(:book) }

  it "It is valid with correct attributes" do
    review = Review.new(stars: 5, user: user, book: book)

    expect(review).to be_valid
  end

  it "not valid without stars" do
    review = Review.new(stars: nil, user: user, book: book)

    expect(review).not_to be_valid
  end

  it "It is not valid if the stars are not between 1 and 5" do
    review = Review.new(stars: 7, user: user, book: book)

    expect(review).not_to be_valid
  end

  it "It is not valid if the content exceeds 1000 characters" do
    review = Review.new(
      stars: 5,
      content: "a" * 1001,
      user: user,
      book: book
    )

    expect(review).not_to be_valid
  end

  describe "#valid_for_average?" do
    it "returns true if the user is not banned" do
      review = Review.new(user: user)

      expect(review.valid_for_average?).to eq(true)
    end

    it "returns false if the user is banned" do
      review = Review.new(user: create(:user, :banned))

      expect(review.valid_for_average?).to eq(false)
    end
  end
end
