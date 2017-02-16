class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = @group.messages("created_at ASC")
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
      flash[:success] = "メッセージ送信完了です(´･ω･`)"
    else
      redirect_to group_messages_path
      flash[:alert] = "メッセージを入力してください。"
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
