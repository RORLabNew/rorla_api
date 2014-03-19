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

class Scrap < ActiveRecord::Base
  belongs_to :scraper, class_name: "User"

  validates :title, presence: true
  validates :url, presence: true

  def self.myscraps(user)
    Scrap.where( scraper: user)
  end
end
