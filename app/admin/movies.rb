ActiveAdmin.register Movie do
  config.sort_order = 'id_asc'
  config.filters = false

  permit_params :creator_id, :name, :year, :director, :main_star, :description, genre_ids: []

  form title: 'Movie' do |f|
    inputs 'Details' do
      input :creator_id, as: :select, collection: User.all, label: 'User'
      input :name
      input :year, as: :select, collection: (1900..Time.now.year).to_a
      input :director
      input :main_star
      input :description
      input :favorited, input_html: { disabled: true, value: object.users_movies.favorited.count }
      input :genre_ids, as: :tags, collection: Genre.all, label: 'Genres'
    end

    actions
  end

  index do
    selectable_column
    column 'User', &:creator
    column :name
    column :year
    column :director
    column :main_star
    column :description
    column 'Favorited' do |movie|
      movie.users_movies.favorited.collect(&:username).join(', ')
    end
    column :genres

    actions
  end

  show do
    attributes_table do
      row 'User', &:creator
      row :name
      row :year
      row :director
      row :main_star
      row :description
      row 'Favorited' do
        movie.users_movies.favorited.collect(&:username).join(', ')
      end
      row :genres
    end
  end

end
