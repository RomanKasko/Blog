class DropTaggings < ActiveRecord::Migration[6.1]
  def up
    drop_table :taggings
  end
end
