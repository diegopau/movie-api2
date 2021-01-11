class UsersMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  delegate :username, to: :user
  delegate :name, to: :movie
  delegate :user_id, to: :user

  scope :favorited, -> { where(favorited: true) }
end
