class DropTags < ActiveRecord::Migration[6.1]
  def up
    drop_table :tags
  end
end
