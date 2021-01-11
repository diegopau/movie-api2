class User < ApplicationRecord
  has_many :users_movies
  has_many :movies, through: :users_movies

  validates :username, presence: true, length: { maximum: 20 },
                                    format: {
                                      with: /\A[a-zA-Z0-9_]+\Z/,
                                      message: '20 characters limit, only alphanumeric characters and the underscore `_` are allowed'
                                    }, uniqueness: { case_sensitive: false }
end
