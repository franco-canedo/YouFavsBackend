class CreateCategoryVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :category_videos do |t|
      t.integer :category_id
      t.integer :video_id
      t.timestamps
    end
  end
end
