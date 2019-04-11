require 'rails_helper'

RSpec.describe 'Book Show Page', type: :feature do
  describe 'as a visitor visiting the books show page' do
    before :each do
      @book_1 = Book.create!(title: "The Hobbit")

      @user_1 = User.new(name: "Tom")
      @user_2 = User.new(name: "Jerry")

      @review_1 = @book_1.reviews.create!(rating: 5, content: "Really Good", user: @user_1)
      @review_2 = @book_1.reviews.create!(rating: 3, content: "Average Read", user: @user_2)
    end

    it 'shows the book title, list of reviews with - rating, content, user name' do

      visit book_path(@book_1)

      expect(page).to have_content(@book_1.title)

      within "#review-#{@review_1.id}" do
        expect(page).to have_content("Rating: #{@review_1.rating}")
        expect(page).to have_content("Content: #{@review_1.content}")
        expect(page).to have_content("User: #{@review_1.user.name}")
      end

      within "#review-#{@review_2.id}" do
        expect(page).to have_content("Rating: #{@review_2.rating}")
        expect(page).to have_content("Content: #{@review_2.content}")
        expect(page).to have_content("User: #{@review_2.user.name}")
      end
    end

    it 'shows the average rating for the book' do

      visit book_path(@book_1)

      expect(page).to have_content("Average Rating: #{@book_1.average_rating}")
    end

    it 'shows the highest rating for the book, along with the review text and name of reviewer' do

      visit book_path(@book_1)

      within "#top-review" do
        expect(page).to have_content("Top Rating: #{@book_1.top_review.rating}")
        expect(page).to have_content("Content: #{@book_1.top_review.content}")
        expect(page).to have_content("User: #{@book_1.top_review.user.name}")
      end
    end

    it 'shows the highest rating for the book, along with the review text and name of reviewer' do

      visit book_path(@book_1)

      within "#worst-review" do
        expect(page).to have_content("Worst Rating: #{@book_1.worst_review.rating}")
        expect(page).to have_content("Content: #{@book_1.worst_review.content}")
        expect(page).to have_content("User: #{@book_1.worst_review.user.name}")
      end
    end
  end
end
