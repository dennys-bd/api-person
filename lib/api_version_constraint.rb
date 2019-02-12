class ApiVersionConstraint
  def initialize params
    @version = params[:version]
  end

  def matches? req
    req.headers['Accept'].include?("application/api.v#{@version}")
  end

end
