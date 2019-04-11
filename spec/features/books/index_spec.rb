require 'rails_helper'

RSpec.describe 'Book Index Page', type: :feature do
  describe 'as a visitor visiting the books index page' do
    before :each do
      @book_1 = Book.create!(title: "The Hobbit")
      @book_2 = Book.create!(title: "Fun & Games")
    end

    it 'shows all book titles in the database, and each title is a link to a show page' do

      visit books_path

      expect(page).to have_link(@book_1.title)
      expect(page).to have_link(@book_2.title)
    end
  end
end
