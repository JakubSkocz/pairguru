# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  description :text
#  raiting      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :movie_id, uniqueness: {scope: :user_id, message: 'You can add only one comment per movie'}

  validates_inclusion_of :rating, in: 1..5
  validates_presence_of :description

end
