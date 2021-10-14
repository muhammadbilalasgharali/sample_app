# frozen_string_literal: true

class GroupRelationshipsController < ApplicationController
  before_action :logged_in_user
  def create
    @group = Group.find(params[:group_id])
    current_user.follow_group(@group)

    respond_to do |format|
      format.html { redirect_to @group }
      format.js
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    current_user.unfollow_group(@group)

    respond_to do |format|
      format.html { redirect_to @group }
      format.js
    end
  end
end
