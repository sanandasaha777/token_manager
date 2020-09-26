require "rails_helper"

RSpec.describe Token, type: :model do
  let(:token) { create(:token) }

  describe "#available" do
    let!(:available_token) { create(:token) }
    let!(:blocked_token)   { create(:token, expire_at: DateTime.now - 1.hours, assigned_at: DateTime.now - 2.hours) }

    it "should return available token" do
      expect(Token.available).to include(available_token)
    end

    it "should not return blocked token" do
      expect(Token.available).not_to include(blocked_token)
    end
  end

  describe ".keep_alive" do
    it "should not have assigned_at nil" do
      expect(token.keep_alive).not_to eq(nil)
    end

    it "should update assigned_at" do
      token.keep_alive
      prev_assigned_at = token.assigned_at
      token.keep_alive
      next_assigned_at = token.assigned_at
      expect(prev_assigned_at < next_assigned_at).to eq(true)
    end
  end
end
