# == Schema Information
#
# Table name: scraps
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  description :text
#  url         :string(255)      not null
#  shared      :boolean          default(TRUE)
#  scraper_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Scrap do
  describe "모델 객체의 생성" do
    it "> 생성한 Scrap 객체는 유효하다." do
      expect(build(:scrap)).to be_valid
    end
  end

  describe "유효성 검증" do
    it "title은 필수항목이다." do
      expect(build(:scrap)).to validate_presence_of :title
    end
    it "url은 필수항목이다." do
      expect(build(:scrap)).to validate_presence_of :url
    end
    it "shared의 디폴트 값은 true이다." do
      expect(build(:scrap).shared).to eq true
    end
  end
  describe "관계선언 검증" do
    it "belongs_to :user" do
      expect(create(:scrap)).to belong_to :scraper
    end
  end
  describe "스코프 및 클래스 메소드 검증" do
    it "내가 작성한 scrap 목록" do
      user = create(:user)
      scraps = create_list(:scrap, 5, scraper: user)
      expect(Scrap.myscraps(user).size).to eq 5
    end
  end
  describe "인스턴스 메소드 검증"
end
