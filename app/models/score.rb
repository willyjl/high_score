class Score < ApplicationRecord
  belongs_to :user

  after_create :update_user_score
  after_destroy :update_user_score

  validates :point, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }

  def update_user_score
    user.update(
      lowest_score: user.scores.minimum(:point),
      average_score: user.scores.average(:point),
      highest_score: user.scores.maximum(:point)
    )
  end
end
