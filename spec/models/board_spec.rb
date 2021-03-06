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

require 'rails_helper'

RSpec.describe Board, type: :model do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :name }
  it { should belong_to :user }
  it { should have_many :lists }
end
