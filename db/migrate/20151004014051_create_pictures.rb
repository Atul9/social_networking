class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.attachment :collage
      t.belongs_to :imageable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
