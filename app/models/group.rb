class Group < ApplicationRecord
  has_many :chat_group_users
  has_many :users, through: :chat_group_users
  has_many :messages

  validates :name, presence: :true
end
