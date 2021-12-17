require 'rails_helper'

RSpec.describe Score, type: :model do
  it { should have_db_column(:point).of_type(:float) }

  it { should belong_to :user }

  it do
    should validate_numericality_of(:point).is_greater_than_or_equal_to(0)
  end
  it do
    should validate_numericality_of(:point).is_less_than_or_equal_to(100)
  end
end
