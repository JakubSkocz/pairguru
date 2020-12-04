require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.create(:comment) }

  it { expect(comment).to be_valid }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:movie) }  
  it { is_expected.to validate_presence_of(:description) }  
end
