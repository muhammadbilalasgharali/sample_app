# frozen_string_literal: true

class GroupRelationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :group
  validates :follower_id, presence: true
end
