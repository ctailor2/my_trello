# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#

class Board < ActiveRecord::Base
  belongs_to :board

  validates :user_id, :name, presence: true

  class Entity < Grape::Entity
    expose :name
  end
end

