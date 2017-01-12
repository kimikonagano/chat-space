class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column_null :groups, :created_at, true
    change_column_null :groups, :updated_at, true
  end
end
