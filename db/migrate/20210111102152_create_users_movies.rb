class CreateUsersMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :users_movies do |t|
      t.integer :user_id
      t.integer :movie_id
      t.boolean :favorited, default: false

      t.timestamps
    end
  end
end
