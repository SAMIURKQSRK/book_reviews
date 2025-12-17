require "rails_helper"

RSpec.describe "Books", type: :request do
  describe "GET /" do
    it "respond successfully" do
      create(:book)

      get "/"

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /books/:id" do
    it "shows a book" do
      book = create(:book)

      get "/books/#{book.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(book.title.capitalize)
    end
  end
end
