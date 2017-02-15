class GroupsController < ApplicationController

  before_action :find_group, only: [:edit, :update]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to action: :index
      flash[:success] = "チャットグループが作成されました。"
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group)
      flash[:success] = "チャットグループが更新されました･*･:≡( ε:)"
    else
      render action: :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
