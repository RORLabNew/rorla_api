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

# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :scrap do
    title Faker::Lorem.paragraph
    description Faker::Lorem.sentence
    url Faker::Internet.url
    scraper factory: :user
  end
end
