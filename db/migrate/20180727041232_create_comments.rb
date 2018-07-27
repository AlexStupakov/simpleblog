class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :author
      t.string :content
      t.references :comment_goal, polymorphic: true, index: true

      t.timestamps
    end
    add_index :comments, [:comment_goal_id, :comment_goal_type, :created_at], name: 'my_index'
  end
end
