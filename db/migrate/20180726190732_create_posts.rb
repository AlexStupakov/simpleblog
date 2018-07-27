class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.string :filename
      t.ineger :category_id

      t.timestamps
    end
    add_index :posts, [:category_id, :created_at]
  end
end
