# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  has_many :microposts, dependent: :destroy

  has_many :passive_relationships, class_name: 'GroupRelationship', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
end
