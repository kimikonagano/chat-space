class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    redirect_to action: :index
  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end
end
