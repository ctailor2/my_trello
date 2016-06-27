# == Schema Information
#
# Table name: client_tokens
#
#  id         :integer          not null, primary key
#  label      :string           not null
#  token      :string           not null
#  active     :boolean          default("true"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_client_tokens_on_token  (token) UNIQUE
#

require 'rails_helper'

RSpec.describe ClientToken, type: :model do
  subject { ClientToken.new(label: 'label', token: 'token') }

  it { should validate_presence_of :token }
  it { should validate_presence_of :label }
  it { should validate_presence_of :active }
  it { should validate_uniqueness_of :token }
end
