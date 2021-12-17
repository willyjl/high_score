class UsersController < ApplicationController
  def index
    _, users = pagy(User.all)
    render json: users.to_json
  end

  def show
    user = User.find(params[:id])
    render json: user.to_json(include: :scores)
  end
end
