class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.string :accessible_by
      t.belongs_to :user
      t.timestamps
    end
  end
end
