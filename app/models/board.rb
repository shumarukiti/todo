# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  name       :string
#  overview   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#

class Board < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 100 }
  validates :name, uniqueness: true

  validates :overview, presence: true
  validates :overview, uniqueness: true
end
