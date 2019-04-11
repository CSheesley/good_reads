class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :content
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
    end
  end
end
