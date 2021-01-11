ActiveAdmin.register User do
  config.sort_order = 'id_asc'

  permit_params :username

  index do
    selectable_column
    column :username
    column 'Favorite Movies' do |user|
    	user.users_movies.favorited.collect(&:name).join(', ')
    end
    column :genres

    actions
  end
end
