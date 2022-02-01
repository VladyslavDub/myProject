class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :object, polymorphic: true, null: false
      t.integer :voter_id

      t.timestamps
    end
  end
end
