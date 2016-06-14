class AddUserIdToTools < ActiveRecord::Migration
  def change
    add_column :tools, :user_id, :integer
    add_foreign_key :tools, :users
  end
end
