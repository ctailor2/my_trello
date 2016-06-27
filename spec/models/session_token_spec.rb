# == Schema Information
#
# Table name: session_tokens
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  token      :string           not null
#  expires_at :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_session_tokens_on_token    (token) UNIQUE
#  index_session_tokens_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe SessionToken, type: :model do
  let(:user) { User.create(name: 'name', email: 'email@email.com', password: 'password', password_confirmation: 'password') }

  subject { SessionToken.new(user_id: user.id, token: 'token', expires_at: DateTime.now.utc + 1.day) }

  it { should validate_presence_of :token }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :expires_at }
  it { should validate_uniqueness_of :token }
  it { should belong_to :user }
end
