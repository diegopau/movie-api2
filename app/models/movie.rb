class Movie < ApplicationRecord
  has_and_belongs_to_many :genres
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  has_many :users_movies
  has_many :users, through: :users_movies

  validates :name, presence: true, length: { maximum: 80 }
  validates :creator_id, :year, :genre_ids, presence: true
  validates :main_star, length: { maximum: 60 }
  validates :description, length: { maximum: 400 }
  validates_length_of :year, is: 4,  message: "Year must be 4 digit long"
end
