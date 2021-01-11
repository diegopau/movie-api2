ActiveAdmin.register UsersMovie do
  menu label: "Favorite Movies"
  config.sort_order = 'id_asc'
  config.clear_action_items!
  config.filters = false

  controller do
    def scoped_collection
      UsersMovie.where(id: UsersMovie.favorited.uniq{ |um| um.movie_id })
    end
  end

  index title: "Favorite Movies" do
    selectable_column
    column :movie
    column 'Favorited' do |fav_movie|
      UsersMovie.where(movie_id: fav_movie.movie_id, favorited: true).collect(&:username).join(', ')
    end
  end

  show do
    attributes_table do
      row :movie
      row 'Favorited' do |fav_movie|
        UsersMovie.where(movie_id: fav_movie.movie_id, favorited: true).collect(&:username).join(', ')
      end
    end
  end

end
