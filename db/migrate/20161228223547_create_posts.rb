class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :photo
      t.references :user, foreign_key: true
      t.references :community, foreign_key: true

      t.timestamps
    end
    add_index :posts, [:user_id, :community_id]
    add_index :posts, [:created_at]
  end
end
