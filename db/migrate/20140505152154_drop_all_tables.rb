class DropAllTables < ActiveRecord::Migration
  def change
    drop_table :posts, :categories
  end
end
