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

class SessionToken < ActiveRecord::Base
  include Token

  EXPIRATION_PERIOD = 1.month

  before_create :set_expiration

  belongs_to :user

  validates :user_id, :expires_at, presence: true

  scope :active, -> { order(created_at: :asc).where('expires_at > ?', DateTime.now.utc) }

  private

  def now
    DateTime.now.utc
  end

  def set_expiration
    self.expires_at = now + EXPIRATION_PERIOD
  end

  class Entity < Grape::Entity
    format_with(:iso_timestamp) { |dt| dt.utc.iso8601 }

    expose :token
    with_options(format_with: :iso_timestamp) do
      expose :expires_at
    end
  end
end
