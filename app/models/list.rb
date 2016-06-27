# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  board_id   :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_lists_on_board_id  (board_id)
#

class List < ActiveRecord::Base
  belongs_to :board

  validates :board_id, :name, presence: true

  class Entity < Grape::Entity
    expose :name
  end
end
