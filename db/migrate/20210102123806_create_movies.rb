class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.integer :creator_id
      t.string :name
      t.integer :year
      t.string :director
      t.string :main_star
      t.text :description

      t.timestamps
    end
  end
end
