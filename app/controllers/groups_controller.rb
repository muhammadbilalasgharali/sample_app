# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: :destroy

  def show
    if logged_in?
      # @micropost = current_user.microposts.build if logged_in?
      @group = Group.find(params[:id])
      @micropost = current_user.microposts.build if logged_in?
      @feed_items = Group.find(params[:id]).microposts.paginate(page: params[:page])
    end
  end

  def index
    if logged_in?
      @group = Group.all
    end
  end

  def new
    if logged_in?
      @group = Group.new
    end
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = 'Group created!'
      redirect_to groups_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @group.destroy
    flash[:success] = 'Group deleted'
    # redirect_to request.referer || root_url
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

  def correct_user
    @group = current_user.groups.find_by(id: params[:id])
    # redirect_to root_url if @group.nil?
  end
end
