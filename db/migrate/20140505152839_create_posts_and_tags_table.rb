class CreatePostsAndTagsTable < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null:false

      t.timestamps
    end

    create_table :tags do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :posts_tags, id: false do |t|
      t.integer :post_id
      t.integer :tag_id
    end
  end

  def down
    drop_table :posts
    drop_table :tags
    drop_table :posts_tags
  end
end
