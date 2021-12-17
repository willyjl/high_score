class User < ApplicationRecord
  has_many :scores

  validates :username, presence: true
  validates :username, uniqueness: true
end
