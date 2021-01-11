class Api::V1::MoviesController < ApiController
  include Response
  include ExceptionHandler

  before_action :set_user, only: [:update]

  # PUT /movies/:movie_id
  def update
    render json: { error:  'Unauthorized user, please login!' }, status: 401 and return unless @user
    favorite_movie = @user.users_movies.find_or_initialize_by(movie_id: params[:movie_id])
    if favorite_movie.update(favorited: params[:favorited])
      render json: { favorite_movies:  @user.users_movies.favorited.collect(&:name) }, status: 200
    else
      render json: { error:  favorite_movie.errors.messages }, status: 400
    end
  end

  private

  def set_user
    @user = User.where('lower(username) = ?', params[:username].downcase).first
  end

end
