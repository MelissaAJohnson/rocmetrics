require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryGirl.create(:event)
  end

  it { is_expected.to belong_to(:application) }

  describe "attributes" do
    it "has name" do
      expect(@event).to have_attributes(name: @event.name)
    end
  end
end
