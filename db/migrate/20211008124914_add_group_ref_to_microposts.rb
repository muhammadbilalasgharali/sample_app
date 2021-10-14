# frozen_string_literal: true

class AddGroupRefToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_reference :microposts, :group, foreign_key: true
  end
end
