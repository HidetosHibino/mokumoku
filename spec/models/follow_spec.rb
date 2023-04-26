require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe 'uniqueness' do
    let!(:user) { create(:user) }
    let!(:atherUser) { create(:user) }
    before do
      follow = create(:follow, follower: user, followed: atherUser)
    end
    it 'フォロー関係が逆のものは保存できること' do
      test_follow = build(:follow, follower: atherUser, followed: user)
      expect(test_follow).to be_valid
      expect(test_follow.errors).to be_empty
    end

    it 'フォロー/フォロワーの関係が同じレコードが保存できないこと' do
      test_follow = build(:follow, follower: user, followed: atherUser)
      expect(test_follow).to be_invalid
    end
  end

  # describe 'ohter_than' do
  #   it '自分自身へのフォローは作成できない' do
  #     test_follow = build(:follow, follower: user, followed: user)
  #     expect(test_follow).to be_invalid
  #   end
  # end
end
