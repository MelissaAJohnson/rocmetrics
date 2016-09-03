require 'rails_helper'

RSpec.describe Application, type: :model do
	@user = FactoryGirl.create(:user)
	let(:name) { Faker::Lorem.word }
	let(:url) { Faker::Internet.url }
	let(:application) { Application.create!(name: name, url: url) }

	it { is_expected.to belong_to(:user) }
	it { is_expected.to validate_presence_of (:url) }

	describe "attributes" do
		it "has url" do
			expect(application).to have_attributes(url: url)
		end
	end
end
