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
  pending "add some examples to (or delete) #{__FILE__}"
end
