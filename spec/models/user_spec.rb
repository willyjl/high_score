require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_db_column(:username).of_type(:string) }
  it { should have_db_column(:highest_score).of_type(:float) }
  it { should have_db_column(:average_score).of_type(:float) }
  it { should have_db_column(:lowest_score).of_type(:float) }

  it { should have_many :scores }

  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
end
