class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating)
  end

  def top_review
    reviews.order(rating: "desc").first
  end

  def worst_review
    reviews.order(rating: "asc").first
  end
end
