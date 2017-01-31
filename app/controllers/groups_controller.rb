class GroupsController < ApplicationController

  before_action :find_group, only: [:show, :edit, :update]

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
      redirect_to action: :new
      flash[:alert] = "1 error prohibited this chat_group from being saved:

        グループ名を入力してください"
    end
  end

  def show
    @groups = Group.all
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to action: :index
      flash[:success] = "チャットグループが更新されました･*･:≡( ε:)"
    else
      redirect_to action: :edit
      flash[:alert] = "1 error prohibited this chat_group from being saved:

        グループ名を入力してください"
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
