module Response
  def json_response(object, status=:ok, message)
    render json: { object.class.name.downcase.to_sym => object, message: message, status: status }
  end
end