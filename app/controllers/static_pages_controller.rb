# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build if logged_in?
      @feed_items = current_user.microposts.where(group_id: nil).paginate(page: params[:page])
    end
  end

  def help; end

  def about; end

  def contact; end
end
