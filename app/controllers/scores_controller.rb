class ScoresController < ApplicationController
  def index
    _, scores = pagy(Score.where(query_params))
    render json: scores.to_json
  end

  def create
    user = User.find_or_create_by(username: score_params[:username])
    score = user.scores.create!(point: score_params[:point])
    render json: score.to_json
  end

  def show
    score = Score.find(params[:id])
    render json: score.to_json
  end

  def destroy
    score = Score.find(params[:id])
    render json: score.destroy.to_json
  end

  private 

  def score_params
    params.require(:score).permit(:username, :point)
  end

  def query_params
    from_date = params[:from_date]&.to_datetime || -DateTime::Infinity.new
    to_date = params[:to_date]&.to_datetime || DateTime::Infinity.new
    {
      user_ids: params[:user_ids],
      created_at: from_date..to_date
    }.compact
  end
end
