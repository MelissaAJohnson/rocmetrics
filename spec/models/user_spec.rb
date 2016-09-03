require 'rails_helper'

RSpec.describe User, type: :model do
  @user = FactoryGirl.create(:user)

  it { is_expected.to have_many(:applications) }
end
