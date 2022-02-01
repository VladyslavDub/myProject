class AddLikesCountToPin < ActiveRecord::Migration[6.1]
  def change
    add_column :pins, :likes_count, :integer, default: 0, null:false
  end
end
