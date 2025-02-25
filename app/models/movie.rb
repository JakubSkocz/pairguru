# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  released_at :datetime
#  avatar      :string
#  genre_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Movie < ApplicationRecord
  include ActiveModel::Validations
  validates_with TitleBracketsValidator

  belongs_to :genre

  has_many :comments
  has_many :users, through: :comments
  
end
