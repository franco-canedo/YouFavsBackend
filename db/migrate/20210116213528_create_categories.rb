class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      # t.references :user, null: false, foreign_key: true
      t.integer :user_id
      

      t.timestamps
    end
  end
end
