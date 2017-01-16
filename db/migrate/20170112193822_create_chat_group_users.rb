class CreateChatGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_group_users do |t|
      t.reference :user_id, foreign_key: :true
      t.reference :group_id, foreign_key: :true
      t.timestamps
    end
  end
end
