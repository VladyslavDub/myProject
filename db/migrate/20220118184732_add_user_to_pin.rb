class AddUserToPin < ActiveRecord::Migration[6.1]
  def change
    add_column :pins, :user_id, :integer
  end
end
