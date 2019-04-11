require 'rails_helper'

describe Book, type: :model do
  describe 'validations' do
      it {should have_many :reviews}
  end

  describe 'instance methods' do

    context '#average_rating' do
      it 'calculates the average rating of a book' do
        @book_1 = Book.create!(title: "The Hobbit")

        @user_1 = User.new(name: "Tom")
        @user_2 = User.new(name: "Jerry")

        @review_1 = @book_1.reviews.create!(rating: 5, content: "Really Good", user: @user_1)
        @review_2 = @book_1.reviews.create!(rating: 3, content: "Average Read", user: @user_2)

        expect(@book_1.average_rating).to eq(4)
      end
    end

    context '#top_review' do
      it 'finds the top review of the book' do
        @book_1 = Book.create!(title: "The Hobbit")

        @user_1 = User.new(name: "Tom")
        @user_2 = User.new(name: "Jerry")

        @review_1 = @book_1.reviews.create!(rating: 5, content: "Really Good", user: @user_1)
        @review_2 = @book_1.reviews.create!(rating: 3, content: "Average Read", user: @user_2)

        expect(@book_1.top_review).to eq(@review_1)
      end
    end

    context '#worst_review' do
      it 'finds the lowest review of the book' do
        @book_1 = Book.create!(title: "The Hobbit")

        @user_1 = User.new(name: "Tom")
        @user_2 = User.new(name: "Jerry")

        @review_1 = @book_1.reviews.create!(rating: 5, content: "Really Good", user: @user_1)
        @review_2 = @book_1.reviews.create!(rating: 3, content: "Average Read", user: @user_2)

        expect(@book_1.worst_review).to eq(@review_2)
      end
    end
  end
end
