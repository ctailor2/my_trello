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

require 'rails_helper'

RSpec.describe List, type: :model do
  it { should validate_presence_of :board_id }
  it { should validate_presence_of :name }
  it { should belong_to :board }
end
