class Api::V1::UsersController < ApiController
  include Response
  include ExceptionHandler

  # POST /users
  def create
    user = User.where('lower(username) = ?', params[:username].downcase).first
    if user
      render json: { user: user, favorite_movies:  user.users_movies.favorited.collect(&:name), message: 'user already exists.', status: 409 }
    else
      user = User.new(username: params[:username])
      if user.save
        json_response(user, 200, 'new user has been created.')
      else
        render json: { error:  user.errors.messages }, status: 400 and return
      end
    end
  end
end
