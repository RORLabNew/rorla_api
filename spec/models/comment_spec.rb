# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Comment do
  describe "> Comment모델 객체의 생성" do
    it "> 유효한 데이터로 생성한 Comment 객체는 유효하다." do
			expect(create(:comment)).to be_valid
 		end
 	end

  describe "> 유효성 검증" do
    it "> Title이 없으면 유효하지 않다." do
      expect(build(:comment)).to validate_presence_of :title
    end
    it "> Title이 3글자 이상 255글자 이하이어야 한다." do
      should ensure_length_of(:title).is_at_least(3).is_at_most(255)
    end
    it "> Content가 없으면 유효하지 않다." do
      expect(build(:comment)).to validate_presence_of :content
    end
    it "> Content가 0글자 이상 10000글자 이하이어야 한다." do
      should ensure_length_of(:content).is_at_least(0).is_at_most(10000)
    end
  end

end
