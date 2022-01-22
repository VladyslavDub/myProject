class AddCommentableToComment < ActiveRecord::Migration[6.1]
  def up
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    Comment.find_each do |comment|
      comment.commentable_id = comment.pin_id
      comment.commentable_type = "Pin"
      comment.save
    end
    remove_column :comments, :pin_id
  end

  def down
    add_column :comments, :pin_id, :integer
    Comment.find_each do |comment|
      if comment.commentable_type == "Pin"
        comment.pin_id = comment.commentable_id
        comment.save
      else
        comment.delete
      end
    end
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
  end
end